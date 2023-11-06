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
entity mul2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_f74041be;
architecture arch of mul2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_b750]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_6694]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c2_b7ae]
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1907_c3_048a[uxn_opcodes_h_l1907_c3_048a]
signal printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_0b3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_cac7]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_1058]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1914_c7_cef8]
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_df4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_8624]
signal n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_8624]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1919_c7_8624]
signal t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_8624]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_20e6]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_d136]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1923_c7_d7a2]
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_b7df]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1927_c7_d814]
signal n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_d814]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1927_c7_d814]
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1928_c3_254e]
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_a1b9]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1931_c30_6450]
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_d955]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_b816]
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_b816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_b816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_b816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_b816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1939_c31_36be]
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_b2cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2ea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2ea8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c2_b7ae
n16_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c2_b7ae
t16_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae
tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

-- printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a
printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a : entity work.printf_uxn_opcodes_h_l1907_c3_048a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_cac7
n16_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_cac7
t16_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7
tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output);

-- n16_MUX_uxn_opcodes_h_l1914_c7_cef8
n16_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- t16_MUX_uxn_opcodes_h_l1914_c7_cef8
t16_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8
tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond,
tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_8624
n16_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- t16_MUX_uxn_opcodes_h_l1919_c7_8624
t16_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_8624
tmp16_MUX_uxn_opcodes_h_l1919_c7_8624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6
BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output);

-- n16_MUX_uxn_opcodes_h_l1923_c7_d7a2
n16_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2
tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond,
tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output);

-- n16_MUX_uxn_opcodes_h_l1927_c7_d814
n16_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1927_c7_d814
tmp16_MUX_uxn_opcodes_h_l1927_c7_d814 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond,
tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue,
tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse,
tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e
BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1931_c30_6450
sp_relative_shift_uxn_opcodes_h_l1931_c30_6450 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins,
sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x,
sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y,
sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1939_c31_36be
CONST_SR_8_uxn_opcodes_h_l1939_c31_36be : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x,
CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output,
 n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output,
 n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output,
 n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output,
 CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_e74d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_67ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_aca8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_0df3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_2f31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1929_c3_5278 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_2979_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_68b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_d800_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_8045_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1946_l1902_DUPLICATE_8a4f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_2f31 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_2f31;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_0df3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_0df3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_e74d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_e74d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_67ae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_67ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_68b9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_68b9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_aca8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_aca8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1931_c30_6450] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_ins;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_x;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output := sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_8045 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_8045_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_0b3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_1058] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_d955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_b750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_d136] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_b7df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_df4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1939_c31_36be] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output := CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_b2cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_b750_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0b3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_1058_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_df4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_d136_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_b7df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_d955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_b2cf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1924_l1915_l1928_l1920_DUPLICATE_edba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1927_l1923_l1919_DUPLICATE_26e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1936_l1927_l1923_l1919_DUPLICATE_6692_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_30fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1914_l1911_l1941_l1906_l1936_l1923_l1919_DUPLICATE_d09f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_8045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_8045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1914_l1911_l1906_l1936_l1923_l1919_DUPLICATE_d93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_6450_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_6694] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2ea8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_20e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1928_c3_254e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_left;
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output := BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2ea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1939_c21_d800] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_d800_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_36be_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_b816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_b816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_20e6_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_254e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_d800_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_5fe9_return_output;
     VAR_printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_6694_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;
     -- printf_uxn_opcodes_h_l1907_c3_048a[uxn_opcodes_h_l1907_c3_048a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1907_c3_048a_uxn_opcodes_h_l1907_c3_048a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_a1b9] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- n16_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- t16_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_b816] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output := result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_b816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_b816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1929_c3_5278 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_a1b9_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_b816_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_tmp16_uxn_opcodes_h_l1929_c3_5278;
     -- n16_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1934_c21_2979] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_2979_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1929_c3_5278);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_2979_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_d814] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output := result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_d814_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_d7a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_d7a2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_8624] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_8624_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_cef8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_cef8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_cac7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_cac7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_b7ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1946_l1902_DUPLICATE_8a4f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1946_l1902_DUPLICATE_8a4f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b7ae_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1946_l1902_DUPLICATE_8a4f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1946_l1902_DUPLICATE_8a4f_return_output;
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
