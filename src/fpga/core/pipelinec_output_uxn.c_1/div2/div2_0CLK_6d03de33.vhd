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
-- BIN_OP_EQ[uxn_opcodes_h_l1977_c6_36d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1977_c1_84f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1977_c2_a227]
signal n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1977_c2_a227]
signal tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1977_c2_a227]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1977_c2_a227]
signal t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1978_c3_ac96[uxn_opcodes_h_l1978_c3_ac96]
signal printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1982_c11_f7f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1982_c7_6c07]
signal t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1985_c11_eec4]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1985_c7_c58c]
signal t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_9838]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_20b5]
signal t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1991_c3_baaf]
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_fea2]
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_d33d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_8a62]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_e3c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1999_c3_7e1e]
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2000_c11_e44b]
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2000_c26_31e6]
signal BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2000_c11_619e]
signal MUX_uxn_opcodes_h_l2000_c11_619e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2000_c11_619e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2000_c11_619e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2000_c11_619e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2002_c30_04ec]
signal sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_e1f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2007_c7_2881]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_2881]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2007_c7_2881]
signal result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_2881]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_2881]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2010_c31_5f6c]
signal CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_8d64]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_9df6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_9df6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0
BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output);

-- n16_MUX_uxn_opcodes_h_l1977_c2_a227
n16_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1977_c2_a227
tmp16_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227
result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- t16_MUX_uxn_opcodes_h_l1977_c2_a227
t16_MUX_uxn_opcodes_h_l1977_c2_a227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond,
t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue,
t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse,
t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

-- printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96
printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96 : entity work.printf_uxn_opcodes_h_l1978_c3_ac96_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output);

-- n16_MUX_uxn_opcodes_h_l1982_c7_6c07
n16_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07
tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07
result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- t16_MUX_uxn_opcodes_h_l1982_c7_6c07
t16_MUX_uxn_opcodes_h_l1982_c7_6c07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond,
t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue,
t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse,
t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c7_c58c
n16_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c
tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- t16_MUX_uxn_opcodes_h_l1985_c7_c58c
t16_MUX_uxn_opcodes_h_l1985_c7_c58c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond,
t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue,
t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse,
t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output);

-- n16_MUX_uxn_opcodes_h_l1990_c7_20b5
n16_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5
tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_20b5
t16_MUX_uxn_opcodes_h_l1990_c7_20b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf
BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left,
BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right,
BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output);

-- n16_MUX_uxn_opcodes_h_l1994_c7_d33d
n16_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d
tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d
result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_e3c6
n16_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6
tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e
BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right,
BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left,
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right,
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6
BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left,
BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right,
BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output);

-- MUX_uxn_opcodes_h_l2000_c11_619e
MUX_uxn_opcodes_h_l2000_c11_619e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2000_c11_619e_cond,
MUX_uxn_opcodes_h_l2000_c11_619e_iftrue,
MUX_uxn_opcodes_h_l2000_c11_619e_iffalse,
MUX_uxn_opcodes_h_l2000_c11_619e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec
sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins,
sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x,
sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y,
sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881
result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond,
result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c
CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x,
CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75
CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output,
 n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output,
 n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output,
 n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output,
 n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output,
 MUX_uxn_opcodes_h_l2000_c11_619e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output,
 CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1979_c3_64c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_7596 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_eca4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_149c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_6112 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2000_c11_619e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2000_c11_619e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2005_c21_3446_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2009_c3_240f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2010_c21_76ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_l1994_DUPLICATE_a9df_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2017_l1973_DUPLICATE_3141_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_eca4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_eca4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_7596 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_7596;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_6112 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_6112;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2009_c3_240f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2009_c3_240f;
     VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_149c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_149c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1979_c3_64c1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1979_c3_64c1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_9838] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_e1f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_fea2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_8a62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_8d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2002_c30_04ec] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_ins;
     sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_x;
     sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output := sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_l1994_DUPLICATE_a9df LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_l1994_DUPLICATE_a9df_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1982_c11_f7f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2010_c31_5f6c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output := CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c11_eec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1977_c6_36d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2000_c11_e44b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c6_36d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_f7f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_eec4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_9838_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_fea2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_8a62_return_output;
     VAR_MUX_uxn_opcodes_h_l2000_c11_619e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_e44b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_8d64_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1991_l1995_l1999_l1986_DUPLICATE_dcaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1998_l1994_l1990_l1985_l1982_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2007_l1998_l1994_l1990_l1985_l1982_l2012_DUPLICATE_73d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_0c28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_l2012_DUPLICATE_b785_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_l1994_DUPLICATE_a9df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_l1994_DUPLICATE_a9df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l2007_l1994_l1990_l1985_l1982_DUPLICATE_9a97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2002_c30_04ec_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_2881] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1999_c3_7e1e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_left;
     BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output := BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2010_c21_76ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2010_c21_76ae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2010_c31_5f6c_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_9df6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_2881] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1991_c3_baaf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_left;
     BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output := BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1977_c1_84f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_9df6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_baaf_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1999_c3_7e1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2010_c21_76ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1987_l1996_DUPLICATE_ef75_return_output;
     VAR_printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1977_c1_84f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_9df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;
     -- t16_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2000_c26_31e6] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_left;
     BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output := BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2007_c7_2881] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_2881] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2007_c7_2881] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output := result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- printf_uxn_opcodes_h_l1978_c3_ac96[uxn_opcodes_h_l1978_c3_ac96] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1978_c3_ac96_uxn_opcodes_h_l1978_c3_ac96_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2000_c26_31e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2007_c7_2881_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- MUX[uxn_opcodes_h_l2000_c11_619e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2000_c11_619e_cond <= VAR_MUX_uxn_opcodes_h_l2000_c11_619e_cond;
     MUX_uxn_opcodes_h_l2000_c11_619e_iftrue <= VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iftrue;
     MUX_uxn_opcodes_h_l2000_c11_619e_iffalse <= VAR_MUX_uxn_opcodes_h_l2000_c11_619e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2000_c11_619e_return_output := MUX_uxn_opcodes_h_l2000_c11_619e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_MUX_uxn_opcodes_h_l2000_c11_619e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2005_c21_3446] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2005_c21_3446_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2000_c11_619e_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2005_c21_3446_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1998_c7_e3c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1998_c7_e3c6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1994_c7_d33d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- n16_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1994_c7_d33d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1990_c7_20b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1990_c7_20b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c7_c58c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_c58c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1982_c7_6c07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output := result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1982_c7_6c07_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1977_c2_a227] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output := result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2017_l1973_DUPLICATE_3141 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2017_l1973_DUPLICATE_3141_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c2_a227_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c2_a227_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2017_l1973_DUPLICATE_3141_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2017_l1973_DUPLICATE_3141_return_output;
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
