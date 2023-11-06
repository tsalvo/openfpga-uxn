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
-- Submodules: 81
entity div2_0CLK_6d03de33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_6d03de33;
architecture arch of div2_0CLK_6d03de33 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_f343]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_8f0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1985_c2_a78a]
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1986_c3_9e18[uxn_opcodes_h_l1986_c3_9e18]
signal printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_f84d]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_2d21]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_15f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1993_c7_a6c6]
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_65b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1998_c7_d6aa]
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1999_c3_bc4c]
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_a519]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_4167]
signal n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_4167]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2002_c7_4167]
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_320d]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_3795]
signal n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_3795]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2006_c7_3795]
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2007_c3_77b8]
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_1690]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_a598]
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2008_c11_c6fc]
signal MUX_uxn_opcodes_h_l2008_c11_c6fc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2010_c30_48f3]
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_5b84]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_acb1]
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_acb1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_acb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_acb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_acb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2018_c31_00b3]
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_fced]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_bfc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_bfc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c2_a78a
n16_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- t16_MUX_uxn_opcodes_h_l1985_c2_a78a
t16_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a
tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond,
tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

-- printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18
printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18 : entity work.printf_uxn_opcodes_h_l1986_c3_9e18_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output);

-- n16_MUX_uxn_opcodes_h_l1990_c7_2d21
n16_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_2d21
t16_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21
tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c7_a6c6
n16_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c7_a6c6
t16_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6
tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond,
tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_d6aa
n16_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_d6aa
t16_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa
tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c
BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_4167
n16_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2002_c7_4167
tmp16_MUX_uxn_opcodes_h_l2002_c7_4167 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond,
tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue,
tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse,
tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_3795
n16_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2006_c7_3795
tmp16_MUX_uxn_opcodes_h_l2006_c7_3795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8
BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output);

-- MUX_uxn_opcodes_h_l2008_c11_c6fc
MUX_uxn_opcodes_h_l2008_c11_c6fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2008_c11_c6fc_cond,
MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue,
MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse,
MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3
sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins,
sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x,
sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y,
sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3
CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x,
CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output,
 n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output,
 MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_8b8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_113a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_063f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_322f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_9611 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_6816_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_435c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_6343_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_67c6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2025_l1981_DUPLICATE_5161_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_9611 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_9611;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_8b8e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_8b8e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_322f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_322f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_435c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_435c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_113a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_113a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_063f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_063f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y := resize(to_signed(-2, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_fced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_a519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2018_c31_00b3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output := CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_f84d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_15f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_f343] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_1690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_320d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_5b84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2010_c30_48f3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_ins;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_x;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output := sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_67c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_67c6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_65b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_f343_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_f84d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_15f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_65b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_a519_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_320d_return_output;
     VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_1690_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_5b84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_fced_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l1999_l2003_l2007_DUPLICATE_2aa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_c698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l2020_l2015_DUPLICATE_e501_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_c439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_bd53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_67c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_67c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_54fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_48f3_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_acb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2018_c21_6343] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_6343_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_00b3_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_bfc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2007_c3_77b8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_left;
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output := BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1999_c3_bc4c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_left;
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output := BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_bfc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_acb1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_8f0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_bc4c_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_77b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_6343_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_fa49_return_output;
     VAR_printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_8f0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_bfc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- printf_uxn_opcodes_h_l1986_c3_9e18[uxn_opcodes_h_l1986_c3_9e18] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1986_c3_9e18_uxn_opcodes_h_l1986_c3_9e18_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_acb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_acb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_acb1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_a598] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_left;
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output := BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_a598_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_acb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     -- n16_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- MUX[uxn_opcodes_h_l2008_c11_c6fc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2008_c11_c6fc_cond <= VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_cond;
     MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue <= VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iftrue;
     MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse <= VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output := MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- t16_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2013_c21_6816] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_6816_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2008_c11_c6fc_return_output);

     -- n16_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- t16_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_6816_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_3795] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output := result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3795_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_4167] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output := result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_4167_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d6aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d6aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_a6c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_a6c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_2d21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_2d21_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_a78a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2025_l1981_DUPLICATE_5161 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2025_l1981_DUPLICATE_5161_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_a78a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2025_l1981_DUPLICATE_5161_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2025_l1981_DUPLICATE_5161_return_output;
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
