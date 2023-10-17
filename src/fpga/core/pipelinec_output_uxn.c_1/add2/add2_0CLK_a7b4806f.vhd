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
entity add2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_a7b4806f;
architecture arch of add2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l890_c6_b7c2]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_702e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l890_c2_20e7]
signal n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l890_c2_20e7]
signal tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_20e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l890_c2_20e7]
signal t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l891_c3_5f8a[uxn_opcodes_h_l891_c3_5f8a]
signal printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l895_c11_a9cd]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c7_6773]
signal n16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l895_c7_6773]
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_6773]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l895_c7_6773]
signal t16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l898_c11_41e3]
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l898_c7_9095]
signal n16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l898_c7_9095]
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9095]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l898_c7_9095]
signal t16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l903_c11_b691]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l903_c7_7e28]
signal n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l903_c7_7e28]
signal tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_7e28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l903_c7_7e28]
signal t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_0a2f]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l906_c7_41ff]
signal n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l906_c7_41ff]
signal tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_41ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l906_c7_41ff]
signal t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l907_c3_d561]
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l910_c11_b62f]
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l910_c7_7d70]
signal n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l910_c7_7d70]
signal tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_7d70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_1ba1]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l913_c7_3d62]
signal n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l913_c7_3d62]
signal tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_3d62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_977b]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l918_c7_c103]
signal n16_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l918_c7_c103]
signal tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_c103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_8f53]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_ccfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l922_c3_6009]
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l923_c11_2598]
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_6b20]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_375b]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_0a16]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_0a16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_0a16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_0a16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_0a16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l933_c31_6bed]
signal CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l935_c11_9775]
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_4f50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_4f50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2
BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output);

-- n16_MUX_uxn_opcodes_h_l890_c2_20e7
n16_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l890_c2_20e7
tmp16_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7
result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- t16_MUX_uxn_opcodes_h_l890_c2_20e7
t16_MUX_uxn_opcodes_h_l890_c2_20e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond,
t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue,
t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse,
t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

-- printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a
printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a : entity work.printf_uxn_opcodes_h_l891_c3_5f8a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd
BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c7_6773
n16_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c7_6773_cond,
n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- tmp16_MUX_uxn_opcodes_h_l895_c7_6773
tmp16_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond,
tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- t16_MUX_uxn_opcodes_h_l895_c7_6773
t16_MUX_uxn_opcodes_h_l895_c7_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l895_c7_6773_cond,
t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue,
t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse,
t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3
BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output);

-- n16_MUX_uxn_opcodes_h_l898_c7_9095
n16_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l898_c7_9095_cond,
n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- tmp16_MUX_uxn_opcodes_h_l898_c7_9095
tmp16_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond,
tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- t16_MUX_uxn_opcodes_h_l898_c7_9095
t16_MUX_uxn_opcodes_h_l898_c7_9095 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l898_c7_9095_cond,
t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue,
t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse,
t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691
BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output);

-- n16_MUX_uxn_opcodes_h_l903_c7_7e28
n16_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- tmp16_MUX_uxn_opcodes_h_l903_c7_7e28
tmp16_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28
result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- t16_MUX_uxn_opcodes_h_l903_c7_7e28
t16_MUX_uxn_opcodes_h_l903_c7_7e28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond,
t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue,
t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse,
t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output);

-- n16_MUX_uxn_opcodes_h_l906_c7_41ff
n16_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l906_c7_41ff
tmp16_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff
result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- t16_MUX_uxn_opcodes_h_l906_c7_41ff
t16_MUX_uxn_opcodes_h_l906_c7_41ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond,
t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue,
t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse,
t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l907_c3_d561
BIN_OP_OR_uxn_opcodes_h_l907_c3_d561 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left,
BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right,
BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f
BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output);

-- n16_MUX_uxn_opcodes_h_l910_c7_7d70
n16_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l910_c7_7d70
tmp16_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70
result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1
BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output);

-- n16_MUX_uxn_opcodes_h_l913_c7_3d62
n16_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- tmp16_MUX_uxn_opcodes_h_l913_c7_3d62
tmp16_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62
result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b
BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output);

-- n16_MUX_uxn_opcodes_h_l918_c7_c103
n16_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l918_c7_c103_cond,
n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- tmp16_MUX_uxn_opcodes_h_l918_c7_c103
tmp16_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond,
tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103
result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53
BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output);

-- n16_MUX_uxn_opcodes_h_l921_c7_ccfe
n16_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe
tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe
result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l922_c3_6009
BIN_OP_OR_uxn_opcodes_h_l922_c3_6009 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left,
BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right,
BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left,
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right,
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_6b20
sp_relative_shift_uxn_opcodes_h_l925_c30_6b20 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b
BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16
result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output);

-- CONST_SR_8_uxn_opcodes_h_l933_c31_6bed
CONST_SR_8_uxn_opcodes_h_l933_c31_6bed : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x,
CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775
BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output,
 n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output,
 n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output,
 n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output,
 n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output,
 n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output,
 n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output,
 n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output,
 n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output,
 n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output,
 CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_04fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_4f38 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_e955 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3c88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_390e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_a55d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_cbab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_4993 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l923_c3_cce9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_16e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_f1c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_92d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_0a16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_e045_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l940_l886_DUPLICATE_7e7a_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_92d6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_92d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3c88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3c88;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_4f38 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_4f38;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_4993 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_4993;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_cbab := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_cbab;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_16e0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_16e0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_e955 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_e955;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_390e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_390e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_04fa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_04fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_a55d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_a55d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l925_c30_6b20] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c11_b691] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_0a2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l935_c11_9775] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_left;
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output := BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_0a16_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_977b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_8f53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l933_c31_6bed] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x <= VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output := CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_375b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c11_a9cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l910_c11_b62f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_left;
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output := BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c6_b7c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l898_c11_41e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_1ba1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_b7c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_a9cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_41e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_b691_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0a2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_b62f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_1ba1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_977b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_8f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_375b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_9775_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l922_l914_l907_DUPLICATE_583b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l898_l921_DUPLICATE_5300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l895_l918_l913_l910_l906_l935_l903_l930_l898_l921_DUPLICATE_c33e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_ca4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l935_l903_l930_l898_DUPLICATE_1f20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l895_l918_l890_l913_l910_l906_l903_l930_l898_DUPLICATE_e039_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_0a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_6b20_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_702e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_4f50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l907_c3_d561] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_left;
     BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output := BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_4f50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l933_c21_e045] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_e045_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_6bed_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l922_c3_6009] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_left;
     BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output := BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_d561_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right := VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_6009_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_e045_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_6e97_return_output;
     VAR_printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_702e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_4f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_4f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;
     -- n16_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_0a16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- printf_uxn_opcodes_h_l891_c3_5f8a[uxn_opcodes_h_l891_c3_5f8a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l891_c3_5f8a_uxn_opcodes_h_l891_c3_5f8a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- t16_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l923_c11_2598] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_left;
     BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output := BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l923_c3_cce9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_2598_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_n16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_0a16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_t16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_tmp16_uxn_opcodes_h_l923_c3_cce9;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- t16_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l928_c21_f1c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_f1c1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l923_c3_cce9);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- n16_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output := n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_f1c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_t16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     -- t16_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output := t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output := tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- n16_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_ccfe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_n16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_ccfe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_t16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- t16_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output := t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- n16_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_c103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_c103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l913_c7_3d62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output := result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- n16_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- t16_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_n16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_3d62_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l910_c7_7d70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output := result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_n16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_7d70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l906_c7_41ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- n16_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output := n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_n16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_41ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     -- n16_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output := n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l903_c7_7e28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output := result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output := tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_7e28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9095] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_cond;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output := result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output;

     -- n16_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output := tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9095_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l895_c7_6773] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_cond;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output := result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6773_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l890_c2_20e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l940_l886_DUPLICATE_7e7a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l940_l886_DUPLICATE_7e7a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_20e7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_20e7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l940_l886_DUPLICATE_7e7a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l940_l886_DUPLICATE_7e7a_return_output;
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
