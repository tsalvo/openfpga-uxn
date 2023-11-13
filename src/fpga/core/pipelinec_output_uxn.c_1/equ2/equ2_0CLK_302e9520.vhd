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
-- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_915c]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_6168]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c2_d33f]
signal n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1147_c3_15fb[uxn_opcodes_h_l1147_c3_15fb]
signal printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_199d]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_dbd9]
signal n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_2bf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_0773]
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1154_c7_0773]
signal t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1154_c7_0773]
signal n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_db7e]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_7453]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1159_c7_7453]
signal t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_7453]
signal n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1160_c3_831a]
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_ee4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_1f7a]
signal n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_37d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_e724]
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1167_c7_e724]
signal n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1168_c3_fc8d]
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1170_c30_4f3f]
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_0a76]
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1173_c21_03c7]
signal MUX_uxn_opcodes_h_l1173_c21_03c7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_03c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_11d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_6a33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_6a33]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_6a33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c2_d33f
t16_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c2_d33f
n16_MUX_uxn_opcodes_h_l1146_c2_d33f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond,
n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

-- printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb
printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb : entity work.printf_uxn_opcodes_h_l1147_c3_15fb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_dbd9
t16_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_dbd9
n16_MUX_uxn_opcodes_h_l1151_c7_dbd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- t16_MUX_uxn_opcodes_h_l1154_c7_0773
t16_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- n16_MUX_uxn_opcodes_h_l1154_c7_0773
n16_MUX_uxn_opcodes_h_l1154_c7_0773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond,
n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue,
n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse,
n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- t16_MUX_uxn_opcodes_h_l1159_c7_7453
t16_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_7453
n16_MUX_uxn_opcodes_h_l1159_c7_7453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a
BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_1f7a
n16_MUX_uxn_opcodes_h_l1163_c7_1f7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- n16_MUX_uxn_opcodes_h_l1167_c7_e724
n16_MUX_uxn_opcodes_h_l1167_c7_e724 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond,
n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue,
n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse,
n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d
BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f
sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins,
sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x,
sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y,
sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output);

-- MUX_uxn_opcodes_h_l1173_c21_03c7
MUX_uxn_opcodes_h_l1173_c21_03c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1173_c21_03c7_cond,
MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue,
MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse,
MUX_uxn_opcodes_h_l1173_c21_03c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output,
 MUX_uxn_opcodes_h_l1173_c21_03c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_2bfa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_6520 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4167 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_6aa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_3234 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_c1c1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1142_l1181_DUPLICATE_34d4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_6aa2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_6aa2;
     VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4167 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4167;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_2bfa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_2bfa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_6520 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_6520;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_3234 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_3234;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_db7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_c1c1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_c1c1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_2bf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_ee4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_37d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1170_c30_4f3f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_ins;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_x;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output := sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_915c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_199d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_11d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_915c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_199d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_2bf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_db7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_ee4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_37d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_11d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_656f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1154_l1151_l1175_l1167_l1163_l1159_DUPLICATE_788f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_d616_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1175_l1163_l1159_DUPLICATE_9f5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_c1c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_c1c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1154_l1151_l1146_l1167_l1163_l1159_DUPLICATE_680e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_4f3f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_6168] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1160_c3_831a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_left;
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output := BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_6a33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_6a33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1168_c3_fc8d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_left;
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output := BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_6a33] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_831a_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_fc8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1165_l1156_DUPLICATE_6d6a_return_output;
     VAR_printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_6168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_6a33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_0a76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output;

     -- n16_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- t16_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- printf_uxn_opcodes_h_l1147_c3_15fb[uxn_opcodes_h_l1147_c3_15fb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1147_c3_15fb_uxn_opcodes_h_l1147_c3_15fb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0a76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- n16_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- MUX[uxn_opcodes_h_l1173_c21_03c7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1173_c21_03c7_cond <= VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_cond;
     MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue <= VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iftrue;
     MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse <= VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_return_output := MUX_uxn_opcodes_h_l1173_c21_03c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue := VAR_MUX_uxn_opcodes_h_l1173_c21_03c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_e724] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output := result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_e724_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- t16_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_1f7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- n16_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_1f7a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_7453] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_7453_return_output;
     -- n16_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_0773] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output := result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_0773_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_dbd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_dbd9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_d33f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1142_l1181_DUPLICATE_34d4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1142_l1181_DUPLICATE_34d4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_d33f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1142_l1181_DUPLICATE_34d4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1142_l1181_DUPLICATE_34d4_return_output;
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
