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
-- BIN_OP_EQ[uxn_opcodes_h_l890_c6_8e36]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_80d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l890_c2_5c4d]
signal t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l891_c3_d47b[uxn_opcodes_h_l891_c3_d47b]
signal printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l895_c11_9f6d]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c7_95de]
signal n16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l895_c7_95de]
signal tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l895_c7_95de]
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l895_c7_95de]
signal t16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l898_c11_5b01]
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l898_c7_9e72]
signal n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l898_c7_9e72]
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9e72]
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l898_c7_9e72]
signal t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l903_c11_130c]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l903_c7_4de2]
signal n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l903_c7_4de2]
signal tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l903_c7_4de2]
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l903_c7_4de2]
signal t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_61b3]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l906_c7_0964]
signal n16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l906_c7_0964]
signal tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l906_c7_0964]
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l906_c7_0964]
signal t16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l907_c3_ba03]
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l910_c11_a8ae]
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l910_c7_e855]
signal n16_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l910_c7_e855]
signal tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l910_c7_e855]
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_c3b4]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l913_c7_0e1e]
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_22a1]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l918_c7_0b61]
signal n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l918_c7_0b61]
signal tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_0b61]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a308]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l921_c7_394c]
signal n16_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l921_c7_394c]
signal tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_394c]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l922_c3_16ae]
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l923_c11_3a81]
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_1233]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_3f02]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_819d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_819d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_819d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_819d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_819d]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l933_c31_8b02]
signal CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l935_c11_2e7a]
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_b115]
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_b115]
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36
BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output);

-- n16_MUX_uxn_opcodes_h_l890_c2_5c4d
n16_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d
tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d
result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- t16_MUX_uxn_opcodes_h_l890_c2_5c4d
t16_MUX_uxn_opcodes_h_l890_c2_5c4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond,
t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue,
t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse,
t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

-- printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b
printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b : entity work.printf_uxn_opcodes_h_l891_c3_d47b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d
BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c7_95de
n16_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c7_95de_cond,
n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l895_c7_95de
tmp16_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond,
tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de
result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- t16_MUX_uxn_opcodes_h_l895_c7_95de
t16_MUX_uxn_opcodes_h_l895_c7_95de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l895_c7_95de_cond,
t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue,
t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse,
t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01
BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output);

-- n16_MUX_uxn_opcodes_h_l898_c7_9e72
n16_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- tmp16_MUX_uxn_opcodes_h_l898_c7_9e72
tmp16_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- t16_MUX_uxn_opcodes_h_l898_c7_9e72
t16_MUX_uxn_opcodes_h_l898_c7_9e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond,
t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue,
t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse,
t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c
BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output);

-- n16_MUX_uxn_opcodes_h_l903_c7_4de2
n16_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l903_c7_4de2
tmp16_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2
result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- t16_MUX_uxn_opcodes_h_l903_c7_4de2
t16_MUX_uxn_opcodes_h_l903_c7_4de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond,
t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue,
t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse,
t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3
BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output);

-- n16_MUX_uxn_opcodes_h_l906_c7_0964
n16_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l906_c7_0964_cond,
n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- tmp16_MUX_uxn_opcodes_h_l906_c7_0964
tmp16_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond,
tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964
result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- t16_MUX_uxn_opcodes_h_l906_c7_0964
t16_MUX_uxn_opcodes_h_l906_c7_0964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l906_c7_0964_cond,
t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue,
t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse,
t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03
BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left,
BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right,
BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output);

-- n16_MUX_uxn_opcodes_h_l910_c7_e855
n16_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l910_c7_e855_cond,
n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- tmp16_MUX_uxn_opcodes_h_l910_c7_e855
tmp16_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond,
tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855
result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4
BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output);

-- n16_MUX_uxn_opcodes_h_l913_c7_0e1e
n16_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e
tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1
BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output);

-- n16_MUX_uxn_opcodes_h_l918_c7_0b61
n16_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- tmp16_MUX_uxn_opcodes_h_l918_c7_0b61
tmp16_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61
result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output);

-- n16_MUX_uxn_opcodes_h_l921_c7_394c
n16_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l921_c7_394c_cond,
n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l921_c7_394c
tmp16_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond,
tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c
result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae
BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left,
BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right,
BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left,
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right,
BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_1233
sp_relative_shift_uxn_opcodes_h_l925_c30_1233 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d
result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l933_c31_8b02
CONST_SR_8_uxn_opcodes_h_l933_c31_8b02 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x,
CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a
BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output,
 n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output,
 n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output,
 n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output,
 n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output,
 n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output,
 BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output,
 n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output,
 n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output,
 n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output,
 n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output,
 CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_6009 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_80ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_78b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_c261 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_02df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_799d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_f60e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l923_c3_2a53 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_fb4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_7917_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_3d2a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_819d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_7e73_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l940_l886_DUPLICATE_1cd8_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_3d2a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_3d2a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_799d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_799d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_80ac := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_80ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_78b3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_78b3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_02df := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_02df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_f60e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_f60e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_6009 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_6009;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d2c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d2c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_c261 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_c261;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_fb4a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_fb4a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_c3b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c11_9f6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_1233] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c11_130c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l898_c11_5b01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_left;
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output := BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l910_c11_a8ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_61b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_3f02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l933_c31_8b02] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x <= VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output := CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l935_c11_2e7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_819d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_22a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c6_8e36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a308] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_8e36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_9f6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_5b01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_130c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_61b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a8ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_c3b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_22a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3f02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_2e7a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l899_l914_l922_l907_DUPLICATE_6508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l898_l921_l895_l918_l890_DUPLICATE_ae64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l921_l895_l918_DUPLICATE_b602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_bff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l913_l910_l906_l935_l903_l930_l898_l895_l918_l890_DUPLICATE_5635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l913_l910_l906_l903_l930_l898_l895_l918_l890_DUPLICATE_c223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l930_c7_819d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_1233_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_b115] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_80d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l933_c21_7e73] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_7e73_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l933_c31_8b02_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l922_c3_16ae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_left;
     BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output := BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_b115] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l907_c3_ba03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_left;
     BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output := BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l907_c3_ba03_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right := VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l922_c3_16ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_7e73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l915_l900_DUPLICATE_dd34_return_output;
     VAR_printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_80d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_b115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_819d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_b115_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_819d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- printf_uxn_opcodes_h_l891_c3_d47b[uxn_opcodes_h_l891_c3_d47b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l891_c3_d47b_uxn_opcodes_h_l891_c3_d47b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output;

     -- t16_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output := t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- n16_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output := n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l923_c11_3a81] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_left;
     BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output := BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_819d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l923_c3_2a53 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l923_c11_3a81_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_819d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_819d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_819d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_tmp16_uxn_opcodes_h_l923_c3_2a53;
     -- tmp16_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output := tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- n16_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l928_c21_7917] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_7917_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l923_c3_2a53);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- t16_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l928_c21_7917_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_t16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     -- n16_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- t16_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_394c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_n16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_394c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_t16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- t16_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output := t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_0b61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;

     -- n16_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output := n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_n16_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_0b61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output := tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- n16_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output := n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l913_c7_0e1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output := result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- t16_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0e1e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l910_c7_e855] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_cond;
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output := result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output := tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- n16_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_n16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l910_c7_e855_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l906_c7_0964] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_cond;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output := result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- n16_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_0964_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l903_c7_4de2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output := result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- n16_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output := n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_4de2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9e72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output := result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- n16_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output := tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9e72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l895_c7_95de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output := result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_95de_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l890_c2_5c4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l940_l886_DUPLICATE_1cd8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l940_l886_DUPLICATE_1cd8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c2_5c4d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l940_l886_DUPLICATE_1cd8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l940_l886_DUPLICATE_1cd8_return_output;
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
