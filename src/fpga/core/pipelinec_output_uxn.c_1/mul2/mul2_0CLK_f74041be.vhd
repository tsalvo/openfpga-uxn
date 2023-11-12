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
-- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_aebc]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_8ea9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c2_b490]
signal n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c2_b490]
signal t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_b490]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c2_b490]
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1907_c3_fd31[uxn_opcodes_h_l1907_c3_fd31]
signal printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_6d8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_73e2]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_2620]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1914_c7_345b]
signal n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1914_c7_345b]
signal t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_345b]
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1914_c7_345b]
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_1ac4]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_3844]
signal n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1919_c7_3844]
signal t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_3844]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_3844]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_55c9]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_2372]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1923_c7_ccdc]
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_f781]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1927_c7_a6d6]
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1928_c3_d638]
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_d818]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1931_c30_689b]
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_b6d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_888c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_888c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_888c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_888c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_888c]
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1939_c31_71f7]
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_e4d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_127e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_127e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c2_b490
n16_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c2_b490
t16_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c2_b490
tmp16_MUX_uxn_opcodes_h_l1906_c2_b490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

-- printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31
printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31 : entity work.printf_uxn_opcodes_h_l1907_c3_fd31_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_73e2
n16_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_73e2
t16_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2
tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output);

-- n16_MUX_uxn_opcodes_h_l1914_c7_345b
n16_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- t16_MUX_uxn_opcodes_h_l1914_c7_345b
t16_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1914_c7_345b
tmp16_MUX_uxn_opcodes_h_l1914_c7_345b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond,
tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_3844
n16_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- t16_MUX_uxn_opcodes_h_l1919_c7_3844
t16_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_3844
tmp16_MUX_uxn_opcodes_h_l1919_c7_3844 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9
BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output);

-- n16_MUX_uxn_opcodes_h_l1923_c7_ccdc
n16_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc
tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond,
tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output);

-- n16_MUX_uxn_opcodes_h_l1927_c7_a6d6
n16_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6
tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond,
tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638
BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1931_c30_689b
sp_relative_shift_uxn_opcodes_h_l1931_c30_689b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins,
sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x,
sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y,
sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7
CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x,
CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output,
 n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output,
 n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output,
 n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output,
 sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_41ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_2162 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_4657 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_1f78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_879d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1929_c3_e1b3 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_7429_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_5836 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_be74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_d7ba_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1902_l1946_DUPLICATE_ccdf_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_41ba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_41ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_1f78 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_1f78;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_4657 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_4657;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_2162 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_2162;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_5836 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_5836;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_879d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_879d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1939_c31_71f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output := CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1931_c30_689b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_ins;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_x;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output := sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_f781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_e4d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_b6d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_6d8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_1ac4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_2620] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_d7ba LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_d7ba_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_2372] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_aebc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_aebc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_6d8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2620_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_1ac4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_2372_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_f781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_b6d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_e4d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1920_l1924_l1928_DUPLICATE_e521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_02a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_dd80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_5b3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_d7ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_d7ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_e796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_689b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_127e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_888c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_888c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1928_c3_d638] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_left;
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output := BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_8ea9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_55c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1939_c21_be74] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_be74_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_71f7_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_127e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_55c9_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_d638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_be74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_b7c4_return_output;
     VAR_printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_8ea9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_127e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_127e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_d818] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_888c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- printf_uxn_opcodes_h_l1907_c3_fd31[uxn_opcodes_h_l1907_c3_fd31] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1907_c3_fd31_uxn_opcodes_h_l1907_c3_fd31_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_888c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_888c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1929_c3_e1b3 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_d818_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_888c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_tmp16_uxn_opcodes_h_l1929_c3_e1b3;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1934_c21_7429] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_7429_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1929_c3_e1b3);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_7429_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_a6d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_a6d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- n16_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_ccdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_ccdc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_3844] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_3844_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_345b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_345b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_73e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_73e2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_b490] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1902_l1946_DUPLICATE_ccdf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1902_l1946_DUPLICATE_ccdf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_b490_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_b490_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1902_l1946_DUPLICATE_ccdf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1902_l1946_DUPLICATE_ccdf_return_output;
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
