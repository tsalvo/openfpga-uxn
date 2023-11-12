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
-- Submodules: 66
entity equ2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_302e9520;
architecture arch of equ2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_3eb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_bf8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_c24d]
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1147_c3_bba1[uxn_opcodes_h_l1147_c3_bba1]
signal printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_e286]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_1706]
signal n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_1706]
signal t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_1706]
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_a2d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_9b9a]
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_3ec1]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_8721]
signal n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1159_c7_8721]
signal t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_8721]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1160_c3_dfd8]
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_d282]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_4970]
signal n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4970]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_054d]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_11e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1168_c3_5ac7]
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1170_c30_b45e]
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_3a55]
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1173_c21_759e]
signal MUX_uxn_opcodes_h_l1173_c21_759e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_759e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_759e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_759e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_5185]
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_b0ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_b0ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_b0ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c2_c24d
n16_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c2_c24d
t16_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

-- printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1
printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1 : entity work.printf_uxn_opcodes_h_l1147_c3_bba1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_1706
n16_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_1706
t16_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output);

-- n16_MUX_uxn_opcodes_h_l1154_c7_9b9a
n16_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- t16_MUX_uxn_opcodes_h_l1154_c7_9b9a
t16_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_8721
n16_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- t16_MUX_uxn_opcodes_h_l1159_c7_8721
t16_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8
BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_4970
n16_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output);

-- n16_MUX_uxn_opcodes_h_l1167_c7_11e4
n16_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7
BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e
sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins,
sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x,
sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y,
sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output);

-- MUX_uxn_opcodes_h_l1173_c21_759e
MUX_uxn_opcodes_h_l1173_c21_759e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1173_c21_759e_cond,
MUX_uxn_opcodes_h_l1173_c21_759e_iftrue,
MUX_uxn_opcodes_h_l1173_c21_759e_iffalse,
MUX_uxn_opcodes_h_l1173_c21_759e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output,
 n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output,
 n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output,
 MUX_uxn_opcodes_h_l1173_c21_759e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_5437 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_3b82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_5b76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_0d06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_2719 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_759e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_759e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_3890_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1181_l1142_DUPLICATE_3030_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_5437 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_5437;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_3b82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_3b82;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_0d06 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_0d06;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_5b76 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_5b76;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_2719 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_2719;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_a2d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_054d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_d282] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_3ec1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_e286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_5185] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_left;
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output := BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1170_c30_b45e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_ins;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_x;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output := sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_3890 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_3890_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_3eb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_3eb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_e286_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_a2d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_3ec1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_d282_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_054d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_5185_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1164_l1160_DUPLICATE_9dd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_8556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_2534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_66ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_945b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_3890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_3890_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_9d30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_b45e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_b0ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_bf8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_b0ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1168_c3_5ac7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_left;
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output := BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1160_c3_dfd8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_left;
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output := BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_b0ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_dfd8_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_5ac7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_497a_return_output;
     VAR_printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_bf8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_b0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_3a55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- t16_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- printf_uxn_opcodes_h_l1147_c3_bba1[uxn_opcodes_h_l1147_c3_bba1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1147_c3_bba1_uxn_opcodes_h_l1147_c3_bba1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1173_c21_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_3a55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- n16_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- t16_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- MUX[uxn_opcodes_h_l1173_c21_759e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1173_c21_759e_cond <= VAR_MUX_uxn_opcodes_h_l1173_c21_759e_cond;
     MUX_uxn_opcodes_h_l1173_c21_759e_iftrue <= VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iftrue;
     MUX_uxn_opcodes_h_l1173_c21_759e_iffalse <= VAR_MUX_uxn_opcodes_h_l1173_c21_759e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1173_c21_759e_return_output := MUX_uxn_opcodes_h_l1173_c21_759e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue := VAR_MUX_uxn_opcodes_h_l1173_c21_759e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_11e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_11e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     -- t16_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4970] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;

     -- n16_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4970_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_8721] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_8721_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_9b9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_9b9a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_1706] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output := result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_1706_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_c24d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1181_l1142_DUPLICATE_3030 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1181_l1142_DUPLICATE_3030_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_c24d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1181_l1142_DUPLICATE_3030_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1181_l1142_DUPLICATE_3030_return_output;
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
