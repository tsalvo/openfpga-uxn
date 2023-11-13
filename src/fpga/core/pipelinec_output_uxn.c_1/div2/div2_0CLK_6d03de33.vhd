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
-- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_a525]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_efef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c2_8b4c]
signal n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1986_c3_1575[uxn_opcodes_h_l1986_c3_1575]
signal printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_1a2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1990_c7_0e6a]
signal n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_e8b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c7_ab0c]
signal n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_843d]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1998_c7_d603]
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d603]
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_d603]
signal t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_d603]
signal n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1999_c3_ebc1]
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_40cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_b85d]
signal n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_28f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2006_c7_1952]
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_1952]
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_1952]
signal n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2007_c3_c208]
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_54c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_36af]
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2008_c11_2e46]
signal MUX_uxn_opcodes_h_l2008_c11_2e46_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_2e46_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2010_c30_1c81]
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_b9e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_2313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_2313]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_2313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_2313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_2313]
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2018_c31_c88f]
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_d481]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_01b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_01b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c
tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- t16_MUX_uxn_opcodes_h_l1985_c2_8b4c
t16_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c2_8b4c
n16_MUX_uxn_opcodes_h_l1985_c2_8b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond,
n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

-- printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575
printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575 : entity work.printf_uxn_opcodes_h_l1986_c3_1575_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a
tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_0e6a
t16_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1990_c7_0e6a
n16_MUX_uxn_opcodes_h_l1990_c7_0e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond,
n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue,
n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse,
n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c
tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c7_ab0c
t16_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c7_ab0c
n16_MUX_uxn_opcodes_h_l1993_c7_ab0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond,
n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1998_c7_d603
tmp16_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_d603
t16_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_d603
n16_MUX_uxn_opcodes_h_l1998_c7_d603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1
BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d
tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_b85d
n16_MUX_uxn_opcodes_h_l2002_c7_b85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2006_c7_1952
tmp16_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_1952
n16_MUX_uxn_opcodes_h_l2006_c7_1952 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output);

-- MUX_uxn_opcodes_h_l2008_c11_2e46
MUX_uxn_opcodes_h_l2008_c11_2e46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2008_c11_2e46_cond,
MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue,
MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse,
MUX_uxn_opcodes_h_l2008_c11_2e46_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81
sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins,
sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x,
sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y,
sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f
CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x,
CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output,
 tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output,
 MUX_uxn_opcodes_h_l2008_c11_2e46_return_output,
 sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output,
 CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_bd3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_349a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_f9cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4eff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_b5be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_b7bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_93f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_464e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_3c00_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1981_l2025_DUPLICATE_2aec_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_b5be := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_b5be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_bd3b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_bd3b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4eff := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4eff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_93f8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_93f8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_349a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_349a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_f9cc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_f9cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_a525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_1a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_843d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2010_c30_1c81] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_ins;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_x;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output := sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2018_c31_c88f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output := CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_b9e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_54c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_40cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_3c00 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_3c00_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_d481] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_e8b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_28f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_a525_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_1a2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_e8b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_843d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_40cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_28f0_return_output;
     VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_54c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_b9e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_d481_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1994_l2007_l1999_l2003_DUPLICATE_0011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2006_DUPLICATE_a92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l2015_l2006_DUPLICATE_00eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_5de5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l2020_l1985_l2015_DUPLICATE_31f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_3c00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2002_l2015_DUPLICATE_3c00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2002_l1998_l1993_l1990_l1985_l2015_DUPLICATE_3972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_1c81_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1999_c3_ebc1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_left;
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output := BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2018_c21_464e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_464e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_c88f_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_2313] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_efef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_2313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_01b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2007_c3_c208] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_left;
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output := BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_01b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_ebc1_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_c208_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_464e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_dbb5_return_output;
     VAR_printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_efef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_01b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_2313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;

     -- printf_uxn_opcodes_h_l1986_c3_1575[uxn_opcodes_h_l1986_c3_1575] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1986_c3_1575_uxn_opcodes_h_l1986_c3_1575_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_2313] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output := result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_36af] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_left;
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output := BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_2313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_36af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_2313_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     -- n16_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- MUX[uxn_opcodes_h_l2008_c11_2e46] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2008_c11_2e46_cond <= VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_cond;
     MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue <= VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iftrue;
     MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse <= VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_return_output := MUX_uxn_opcodes_h_l2008_c11_2e46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- t16_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2013_c21_b7bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_b7bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2008_c11_2e46_return_output);

     -- n16_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_b7bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_1952] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output := result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_1952_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_b85d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_b85d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d603] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output := result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d603_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_ab0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_ab0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_0e6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_0e6a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_8b4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1981_l2025_DUPLICATE_2aec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1981_l2025_DUPLICATE_2aec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_8b4c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1981_l2025_DUPLICATE_2aec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1981_l2025_DUPLICATE_2aec_return_output;
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
