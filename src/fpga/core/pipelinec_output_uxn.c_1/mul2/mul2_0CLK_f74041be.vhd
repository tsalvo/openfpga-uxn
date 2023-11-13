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
-- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_3a03]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_a0c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c2_3236]
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_3236]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c2_3236]
signal t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c2_3236]
signal n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1907_c3_82d4[uxn_opcodes_h_l1907_c3_82d4]
signal printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_37db]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_f39f]
signal n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_e2f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1914_c7_1555]
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_1555]
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1914_c7_1555]
signal t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1914_c7_1555]
signal n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_7cdf]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_fb0b]
signal n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_c27c]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_dab2]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1923_c7_da5b]
signal n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_da1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1927_c7_491a]
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_491a]
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1927_c7_491a]
signal n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1928_c3_eb32]
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_4732]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1931_c30_eba4]
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_5671]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_8a31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_8a31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_8a31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_8a31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_8a31]
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1939_c31_dd79]
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_8910]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_64f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_64f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c2_3236
tmp16_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c2_3236
t16_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c2_3236
n16_MUX_uxn_opcodes_h_l1906_c2_3236 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond,
n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

-- printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4
printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4 : entity work.printf_uxn_opcodes_h_l1907_c3_82d4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f
tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_f39f
t16_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_f39f
n16_MUX_uxn_opcodes_h_l1911_c7_f39f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1914_c7_1555
tmp16_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- t16_MUX_uxn_opcodes_h_l1914_c7_1555
t16_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- n16_MUX_uxn_opcodes_h_l1914_c7_1555
n16_MUX_uxn_opcodes_h_l1914_c7_1555 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond,
n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue,
n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse,
n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b
tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- t16_MUX_uxn_opcodes_h_l1919_c7_fb0b
t16_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_fb0b
n16_MUX_uxn_opcodes_h_l1919_c7_fb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c
BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b
tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1923_c7_da5b
n16_MUX_uxn_opcodes_h_l1923_c7_da5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond,
n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue,
n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse,
n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1927_c7_491a
tmp16_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- n16_MUX_uxn_opcodes_h_l1927_c7_491a
n16_MUX_uxn_opcodes_h_l1927_c7_491a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond,
n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue,
n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse,
n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32
BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4
sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins,
sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x,
sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y,
sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79
CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x,
CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output,
 sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output,
 CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_0ac9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_f75f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_2f73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_cc68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1929_c3_d6d8 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_95c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_f1f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_e345 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_fb93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_c1e8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1946_l1902_DUPLICATE_5674_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_2f73 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_2f73;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_0ac9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_0ac9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_95c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_95c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_cc68 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_cc68;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_e345 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_e345;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_f75f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_f75f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1939_c31_dd79] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output := CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_37db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_dab2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_da1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_3a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_5671] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_7cdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_e2f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1931_c30_eba4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_ins;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_x;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output := sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_c1e8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_c1e8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_8910] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_3a03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_37db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e2f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_7cdf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_dab2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_da1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_5671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_8910_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1924_l1928_l1915_DUPLICATE_643f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1906_l1927_l1923_l1919_l1914_l1911_DUPLICATE_2e80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1941_l1936_l1927_l1923_l1919_l1914_l1911_DUPLICATE_6f66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_fd74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1941_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8a70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_c1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1923_l1936_DUPLICATE_c1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1906_l1936_l1923_l1919_l1914_l1911_DUPLICATE_8753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_eba4_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1939_c21_fb93] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_fb93_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_dd79_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_a0c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_8a31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_c27c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_64f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_8a31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1928_c3_eb32] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_left;
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output := BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_64f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_c27c_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_eb32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_fb93_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1925_l1916_DUPLICATE_22ab_return_output;
     VAR_printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_a0c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_64f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;
     -- printf_uxn_opcodes_h_l1907_c3_82d4[uxn_opcodes_h_l1907_c3_82d4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1907_c3_82d4_uxn_opcodes_h_l1907_c3_82d4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_8a31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output := result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_8a31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_8a31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;

     -- t16_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_4732] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1929_c3_d6d8 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_4732_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_8a31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_tmp16_uxn_opcodes_h_l1929_c3_d6d8;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1934_c21_f1f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_f1f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1929_c3_d6d8);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_f1f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_491a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_491a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_da5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- n16_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_da5b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_fb0b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_fb0b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_1555] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output := result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_1555_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_f39f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_f39f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_3236] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1946_l1902_DUPLICATE_5674 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1946_l1902_DUPLICATE_5674_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_3236_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_3236_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1946_l1902_DUPLICATE_5674_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1946_l1902_DUPLICATE_5674_return_output;
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
