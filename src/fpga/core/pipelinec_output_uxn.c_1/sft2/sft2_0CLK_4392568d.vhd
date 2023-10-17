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
-- Submodules: 89
entity sft2_0CLK_4392568d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_4392568d;
architecture arch of sft2_0CLK_4392568d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_afd7]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2387_c1_1372]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_a79a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l2388_c3_1df1[uxn_opcodes_h_l2388_c3_1df1]
signal printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2392_c11_6054]
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2392_c7_904e]
signal n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2392_c7_904e]
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2392_c7_904e]
signal t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c7_904e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_05aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2395_c7_1282]
signal n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2395_c7_1282]
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2395_c7_1282]
signal t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_1282]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_7354]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_8aa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_6a0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_63ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2404_c3_dc98]
signal CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_095e]
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_a91f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_5439]
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_36b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2411_c3_6e68]
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2413_c30_e2f0]
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2414_c20_d8ba]
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2414_c12_61be]
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2414_c36_1ac0]
signal CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2414_c12_6ea6]
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_a534]
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_44b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_44b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_44b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_44b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_44b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2422_c31_32f2]
signal CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_80b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_2941]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_2941]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output);

-- n16_MUX_uxn_opcodes_h_l2387_c2_a79a
n16_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a
tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- t8_MUX_uxn_opcodes_h_l2387_c2_a79a
t8_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

-- printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1
printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1 : entity work.printf_uxn_opcodes_h_l2388_c3_1df1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left,
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right,
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output);

-- n16_MUX_uxn_opcodes_h_l2392_c7_904e
n16_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2392_c7_904e
tmp16_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- t8_MUX_uxn_opcodes_h_l2392_c7_904e
t8_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2395_c7_1282
n16_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2395_c7_1282
tmp16_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- t8_MUX_uxn_opcodes_h_l2395_c7_1282
t8_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output);

-- n16_MUX_uxn_opcodes_h_l2399_c7_8aa1
n16_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1
tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output);

-- n16_MUX_uxn_opcodes_h_l2402_c7_63ae
n16_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae
tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98
CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x,
CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output);

-- n16_MUX_uxn_opcodes_h_l2407_c7_a91f
n16_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f
tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output);

-- n16_MUX_uxn_opcodes_h_l2410_c7_36b6
n16_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6
tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left,
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right,
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0
sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins,
sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x,
sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y,
sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba
BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left,
BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right,
BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be
BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left,
BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right,
BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0
CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x,
CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6
BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left,
BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right,
BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2
CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x,
CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output,
 n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output,
 n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output,
 n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output,
 n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output,
 n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output,
 CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output,
 n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output,
 n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output,
 sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output,
 CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_9ea6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_60cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_6d07 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_f563 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_00c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e69f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_b848 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_ba8b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_4f90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_44b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_3be1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2411_l2403_DUPLICATE_c549_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2429_l2382_DUPLICATE_38e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_f563 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_f563;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_b848 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_b848;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_6d07 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_6d07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_00c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_00c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e69f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e69f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_9ea6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_9ea6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_60cc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_60cc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_4f90 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_4f90;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right := to_unsigned(8, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := tmp16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_44b8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2414_c20_d8ba] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_left;
     BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output := BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_7354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2422_c31_32f2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output := CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_05aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_afd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_a534] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_left;
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output := BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2413_c30_e2f0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_ins;
     sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_x;
     sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output := sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_6a0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2411_l2403_DUPLICATE_c549 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2411_l2403_DUPLICATE_c549_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output := result.is_sp_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2414_c36_1ac0] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output := CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_80b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_5439] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_left;
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output := BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2392_c11_6054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_left;
     BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output := BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_095e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_d8ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_afd7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_6054_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_05aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_7354_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_6a0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_095e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_5439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_a534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_80b0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2411_l2403_DUPLICATE_c549_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2411_l2403_DUPLICATE_c549_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2395_l2392_l2387_l2410_l2407_l2402_l2399_DUPLICATE_af20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2410_l2407_l2402_l2399_DUPLICATE_58f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_55a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2395_l2424_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_6346_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2395_l2392_l2419_l2387_l2407_l2402_l2399_DUPLICATE_4de5_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right := VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_1ac0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_e2f0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2387_c1_1372] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2422_c21_3be1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_3be1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_32f2_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2411_c3_6e68] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_left;
     BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output := BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_2941] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_2941] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2404_c3_dc98] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output := CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_3be1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_dc98_return_output;
     VAR_printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_1372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2941_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2941_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2414_c12_61be] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_left;
     BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output := BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;

     -- printf_uxn_opcodes_h_l2388_c3_1df1[uxn_opcodes_h_l2388_c3_1df1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2388_c3_1df1_uxn_opcodes_h_l2388_c3_1df1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_44b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_61be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_44b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2414_c12_6ea6] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_left;
     BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output := BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- t8_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2417_c21_ba8b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_ba8b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_6ea6_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_ba8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_36b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_36b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_a91f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_a91f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_63ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_63ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_8aa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_8aa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_1282] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output := result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_1282_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2392_c7_904e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;

     -- Submodule level 11
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_904e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_a79a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2429_l2382_DUPLICATE_38e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2429_l2382_DUPLICATE_38e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_a79a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2429_l2382_DUPLICATE_38e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2429_l2382_DUPLICATE_38e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
