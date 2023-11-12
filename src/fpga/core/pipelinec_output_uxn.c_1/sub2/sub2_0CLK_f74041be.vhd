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
-- Submodules: 79
entity sub2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_f74041be;
architecture arch of sub2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_2830]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_d2ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2367_c2_31c2]
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2368_c3_819d[uxn_opcodes_h_l2368_c3_819d]
signal printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2372_c7_eb99]
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_bf14]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2375_c7_cebb]
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_d801]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2380_c7_e257]
signal n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2380_c7_e257]
signal t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_e257]
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2380_c7_e257]
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_223e]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_f8d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2384_c7_4b4b]
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_7161]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2388_c7_4aca]
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2389_c3_e9cf]
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_8e58]
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2392_c30_083b]
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_027a]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_dd45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_dd45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_dd45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_dd45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_dd45]
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2400_c31_d0e6]
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_9472]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_bd72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_bd72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output);

-- n16_MUX_uxn_opcodes_h_l2367_c2_31c2
n16_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- t16_MUX_uxn_opcodes_h_l2367_c2_31c2
t16_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2
tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond,
tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

-- printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d
printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d : entity work.printf_uxn_opcodes_h_l2368_c3_819d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output);

-- n16_MUX_uxn_opcodes_h_l2372_c7_eb99
n16_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_eb99
t16_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99
tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond,
tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue,
tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse,
tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output);

-- n16_MUX_uxn_opcodes_h_l2375_c7_cebb
n16_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- t16_MUX_uxn_opcodes_h_l2375_c7_cebb
t16_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb
tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond,
tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output);

-- n16_MUX_uxn_opcodes_h_l2380_c7_e257
n16_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- t16_MUX_uxn_opcodes_h_l2380_c7_e257
t16_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2380_c7_e257
tmp16_MUX_uxn_opcodes_h_l2380_c7_e257 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e
BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output);

-- n16_MUX_uxn_opcodes_h_l2384_c7_4b4b
n16_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b
tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond,
tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output);

-- n16_MUX_uxn_opcodes_h_l2388_c7_4aca
n16_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca
tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond,
tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue,
tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse,
tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf
BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2392_c30_083b
sp_relative_shift_uxn_opcodes_h_l2392_c30_083b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins,
sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x,
sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y,
sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6
CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x,
CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9
CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output,
 n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output,
 n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output,
 n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output,
 n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output,
 n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output,
 n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output,
 sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output,
 CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_f66b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_cbf1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_344b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_5997 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_746f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6245_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_a465 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5876_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_f74a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2407_l2363_DUPLICATE_efe4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_a465 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_a465;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_5997 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_5997;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_f66b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_f66b;
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_344b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_344b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_746f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_746f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_cbf1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_cbf1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_bf14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_027a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_f8d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2400_c31_d0e6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output := CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_7161] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_2830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_d801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_f74a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_f74a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_9472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2392_c30_083b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_ins;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_x;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output := sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_2830_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e5f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_bf14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_d801_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_f8d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_7161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_027a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_9472_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2381_l2385_DUPLICATE_f789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2388_l2384_l2380_l2375_DUPLICATE_bd92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2402_l2397_l2388_l2384_l2380_l2375_DUPLICATE_6297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_4ea3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2402_l2367_l2397_l2384_l2380_l2375_DUPLICATE_9008_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_f74a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_f74a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2397_l2384_l2380_l2375_DUPLICATE_1253_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_083b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_dd45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_d2ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_dd45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2400_c21_5876] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5876_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_d0e6_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_223e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_bd72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2389_c3_e9cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_left;
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output := BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_bd72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_223e_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_e9cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_5876_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2377_l2386_DUPLICATE_a3b9_return_output;
     VAR_printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_d2ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_bd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_dd45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output := result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_dd45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_8e58] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_dd45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;

     -- printf_uxn_opcodes_h_l2368_c3_819d[uxn_opcodes_h_l2368_c3_819d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2368_c3_819d_uxn_opcodes_h_l2368_c3_819d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_dd45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     -- n16_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2395_c21_6245] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6245_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_8e58_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- t16_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_6245_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     -- n16_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_4aca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_4aca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_4b4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_4b4b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_e257] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output := result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e257_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     -- n16_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_cebb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_cebb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_eb99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_eb99_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_31c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2407_l2363_DUPLICATE_efe4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2407_l2363_DUPLICATE_efe4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_31c2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2407_l2363_DUPLICATE_efe4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2407_l2363_DUPLICATE_efe4_return_output;
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
