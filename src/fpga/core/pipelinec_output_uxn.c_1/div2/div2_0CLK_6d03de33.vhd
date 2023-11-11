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
-- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_5915]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_760d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1985_c2_6860]
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c2_6860]
signal n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_6860]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1985_c2_6860]
signal t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1986_c3_f998[uxn_opcodes_h_l1986_c3_f998]
signal printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_0b03]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_5b8f]
signal t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_5885]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c7_b0c9]
signal t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_b39d]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_d1de]
signal t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1999_c3_d648]
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_24ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2002_c7_8133]
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_8133]
signal n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_8133]
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_0017]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_3bce]
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2007_c3_87d7]
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_34ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_118a]
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2008_c11_18b7]
signal MUX_uxn_opcodes_h_l2008_c11_18b7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2008_c11_18b7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2010_c30_8e99]
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_38a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_3535]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_3535]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_3535]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_3535]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_3535]
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2018_c31_9787]
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_643a]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_acf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_acf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1985_c2_6860
tmp16_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c2_6860
n16_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- t16_MUX_uxn_opcodes_h_l1985_c2_6860
t16_MUX_uxn_opcodes_h_l1985_c2_6860 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond,
t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue,
t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse,
t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

-- printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998
printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998 : entity work.printf_uxn_opcodes_h_l1986_c3_f998_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f
tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1990_c7_5b8f
n16_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_5b8f
t16_MUX_uxn_opcodes_h_l1990_c7_5b8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9
tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c7_b0c9
n16_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c7_b0c9
t16_MUX_uxn_opcodes_h_l1993_c7_b0c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond,
t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de
tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_d1de
n16_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_d1de
t16_MUX_uxn_opcodes_h_l1998_c7_d1de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648
BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2002_c7_8133
tmp16_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_8133
n16_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce
tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_3bce
n16_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7
BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right,
BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right,
BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output);

-- MUX_uxn_opcodes_h_l2008_c11_18b7
MUX_uxn_opcodes_h_l2008_c11_18b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2008_c11_18b7_cond,
MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue,
MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse,
MUX_uxn_opcodes_h_l2008_c11_18b7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99
sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y,
sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2018_c31_9787
CONST_SR_8_uxn_opcodes_h_l2018_c31_9787 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x,
CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output,
 tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output,
 tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output,
 tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output,
 MUX_uxn_opcodes_h_l2008_c11_18b7_return_output,
 sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output,
 CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_1302 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_50bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_86d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_7d2b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_73f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_e962_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_6398 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_2000_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_81c6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2025_l1981_DUPLICATE_670f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_86d4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_86d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_7d2b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_7d2b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_73f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_73f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_50bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_50bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_6398 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2017_c3_6398;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_1302 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1987_c3_1302;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_24ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_643a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2008_c11_34ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_0b03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_38a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2010_c30_8e99] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_ins;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_x;
     sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output := sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c6_5915] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_81c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_81c6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_0017] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2018_c31_9787] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output := CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_b39d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_5885] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c6_5915_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_0b03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5885_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_b39d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_24ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_0017_return_output;
     VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2008_c11_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_38a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_643a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1999_l1994_l2003_l2007_DUPLICATE_ae62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2002_l1998_l1993_l1990_l1985_DUPLICATE_417d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2015_l2006_l2002_l1998_l1993_l1990_l2020_DUPLICATE_6b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_9714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l2020_l1985_DUPLICATE_43f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_81c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2015_l2002_DUPLICATE_81c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2015_l2002_l1998_l1993_l1990_l1985_DUPLICATE_21c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2010_c30_8e99_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_acf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_3535] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1999_c3_d648] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_left;
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output := BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2018_c21_2000] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_2000_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2018_c31_9787_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1985_c1_760d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2007_c3_87d7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_left;
     BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output := BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_3535] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_acf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_d648_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2007_c3_87d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2018_c21_2000_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1995_l2004_DUPLICATE_2116_return_output;
     VAR_printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1985_c1_760d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_acf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;
     -- t16_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2015_c7_3535] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output := result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;

     -- printf_uxn_opcodes_h_l1986_c3_f998[uxn_opcodes_h_l1986_c3_f998] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1986_c3_f998_uxn_opcodes_h_l1986_c3_f998_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_3535] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_3535] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2008_c26_118a] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_left;
     BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output := BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2008_c26_118a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2015_c7_3535_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     -- MUX[uxn_opcodes_h_l2008_c11_18b7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2008_c11_18b7_cond <= VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_cond;
     MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue <= VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iftrue;
     MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse <= VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_return_output := MUX_uxn_opcodes_h_l2008_c11_18b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- n16_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- t16_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2013_c21_e962] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_e962_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2008_c11_18b7_return_output);

     -- n16_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- t16_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c21_e962_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2006_c7_3bce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2006_c7_3bce_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     -- n16_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2002_c7_8133] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output := result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2002_c7_8133_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_d1de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output := result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_d1de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1993_c7_b0c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1993_c7_b0c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_5b8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_5b8f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c2_6860] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2025_l1981_DUPLICATE_670f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2025_l1981_DUPLICATE_670f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c2_6860_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c2_6860_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2025_l1981_DUPLICATE_670f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2025_l1981_DUPLICATE_670f_return_output;
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
