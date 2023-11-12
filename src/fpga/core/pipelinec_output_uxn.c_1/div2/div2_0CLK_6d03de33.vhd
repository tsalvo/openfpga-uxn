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
-- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_0080]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_116b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c2_6644]
signal n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1985_c2_6644]
signal t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_6644]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1985_c2_6644]
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1986_c3_d89a[uxn_opcodes_h_l1986_c3_d89a]
signal printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_2c90]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_07d1]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_60f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1993_c7_2b09]
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_762b]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1998_c7_a24d]
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1999_c3_60c6]
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_5380]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_3217]
signal n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_3217]
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2002_c7_3217]
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_36a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2006_c7_58a0]
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2007_c3_c34b]
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_841b]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_1e0e]
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2008_c11_8216]
signal MUX_uxn_opcodes_h_l2008_c11_8216_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_8216_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_8216_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_8216_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2010_c30_8f6c]
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_d80c]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_8e68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_8e68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_8e68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_8e68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_8e68]
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2018_c31_27ab]
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_3498]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_88d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_88d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c2_6644
n16_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- t16_MUX_uxn_opcodes_h_l1985_c2_6644
t16_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1985_c2_6644
tmp16_MUX_uxn_opcodes_h_l1985_c2_6644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

-- printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a
printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a : entity work.printf_uxn_opcodes_h_l1986_c3_d89a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output);

-- n16_MUX_uxn_opcodes_h_l1990_c7_07d1
n16_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_07d1
t16_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1
tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c7_2b09
n16_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c7_2b09
t16_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09
tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond,
tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue,
tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse,
tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_a24d
n16_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_a24d
t16_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d
tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond,
tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6
BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_3217
n16_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2002_c7_3217
tmp16_MUX_uxn_opcodes_h_l2002_c7_3217 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond,
tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue,
tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse,
tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_58a0
n16_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0
tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond,
tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output);

-- MUX_uxn_opcodes_h_l2008_c11_8216
MUX_uxn_opcodes_h_l2008_c11_8216 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2008_c11_8216_cond,
MUX_uxn_opcodes_h_l2008_c11_8216_iftrue,
MUX_uxn_opcodes_h_l2008_c11_8216_iffalse,
MUX_uxn_opcodes_h_l2008_c11_8216_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c
sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab
CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x,
CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2
CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output,
 n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output,
 MUX_uxn_opcodes_h_l2008_c11_8216_return_output,
 sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output,
 CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_523d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_718e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_3334 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_bac4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_5fbe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_8216_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_8216_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_4800_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_c9af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_4b20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_fd50_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1981_l2025_DUPLICATE_e476_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_c9af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_c9af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_718e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_718e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_3334 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_3334;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_bac4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_bac4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_523d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_523d;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_5fbe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_5fbe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_3498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_d80c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_fd50 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_fd50_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_36a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_5380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2018_c31_27ab] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output := CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_0080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_60f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2010_c30_8f6c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_ins;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_x;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output := sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_2c90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_762b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_841b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_0080_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_2c90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_60f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_762b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_5380_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_36a6_return_output;
     VAR_MUX_uxn_opcodes_h_l2008_c11_8216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_841b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_d80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_3498_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2007_l1999_l1994_DUPLICATE_ad29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_c43c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_2998_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_259a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_fd50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_fd50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_b05a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8f6c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_88d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_88d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_8e68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2007_c3_c34b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_left;
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output := BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_8e68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2018_c21_4b20] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_4b20_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_27ab_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_116b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1999_c3_60c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_left;
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output := BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_60c6_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c34b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_4b20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2004_l1995_DUPLICATE_b3f2_return_output;
     VAR_printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_116b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_88d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_8e68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_1e0e] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_left;
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output := BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_8e68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output := result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;

     -- printf_uxn_opcodes_h_l1986_c3_d89a[uxn_opcodes_h_l1986_c3_d89a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1986_c3_d89a_uxn_opcodes_h_l1986_c3_d89a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_8e68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_1e0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_8e68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     -- t16_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- n16_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- MUX[uxn_opcodes_h_l2008_c11_8216] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2008_c11_8216_cond <= VAR_MUX_uxn_opcodes_h_l2008_c11_8216_cond;
     MUX_uxn_opcodes_h_l2008_c11_8216_iftrue <= VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iftrue;
     MUX_uxn_opcodes_h_l2008_c11_8216_iffalse <= VAR_MUX_uxn_opcodes_h_l2008_c11_8216_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2008_c11_8216_return_output := MUX_uxn_opcodes_h_l2008_c11_8216_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_MUX_uxn_opcodes_h_l2008_c11_8216_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2013_c21_4800] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_4800_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2008_c11_8216_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_4800_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_58a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- t16_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_58a0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_3217] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output := result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- n16_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_3217_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_a24d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_a24d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_2b09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_2b09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_07d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_07d1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_6644] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1981_l2025_DUPLICATE_e476 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1981_l2025_DUPLICATE_e476_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6644_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6644_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1981_l2025_DUPLICATE_e476_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1981_l2025_DUPLICATE_e476_return_output;
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
