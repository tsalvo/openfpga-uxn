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
-- Submodules: 98
entity equ2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_5ccafc54;
architecture arch of equ2_0CLK_5ccafc54 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_3ac6]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1291_c1_7d5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_dcfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1292_c3_6480[uxn_opcodes_h_l1292_c3_6480]
signal printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_634f]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1296_c7_283f]
signal t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_283f]
signal n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_283f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_984c]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_900a]
signal t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_900a]
signal n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_900a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_5404]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1304_c7_0812]
signal t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1304_c7_0812]
signal n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_0812]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_3770]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1307_c7_e890]
signal t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_e890]
signal n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_e890]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_5983]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_c533]
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_04e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_4735]
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_5ffb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_05d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1319_c7_4052]
signal n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_4052]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_71ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1322_c7_e116]
signal n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_e116]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1323_c3_97a2]
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1325_c32_fc21]
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1325_c32_b068]
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1325_c32_cf5b]
signal MUX_uxn_opcodes_h_l1325_c32_cf5b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_ef14]
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_d737]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_d737]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_d737]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1327_c7_d737]
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_d737]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1331_c24_b6a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1331_c24_7a9d]
signal MUX_uxn_opcodes_h_l1331_c24_7a9d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1333_c11_04f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1333_c7_072d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1333_c7_072d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c2_dcfb
t16_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c2_dcfb
n16_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

-- printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480
printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480 : entity work.printf_uxn_opcodes_h_l1292_c3_6480_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output);

-- t16_MUX_uxn_opcodes_h_l1296_c7_283f
t16_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_283f
n16_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_900a
t16_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_900a
n16_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output);

-- t16_MUX_uxn_opcodes_h_l1304_c7_0812
t16_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- n16_MUX_uxn_opcodes_h_l1304_c7_0812
n16_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output);

-- t16_MUX_uxn_opcodes_h_l1307_c7_e890
t16_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_e890
n16_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983
BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right,
BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output);

-- n16_MUX_uxn_opcodes_h_l1311_c7_04e5
n16_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output);

-- n16_MUX_uxn_opcodes_h_l1314_c7_5ffb
n16_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1319_c7_4052
n16_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1322_c7_e116
n16_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2
BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left,
BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right,
BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21
BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left,
BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right,
BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068
BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left,
BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right,
BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output);

-- MUX_uxn_opcodes_h_l1325_c32_cf5b
MUX_uxn_opcodes_h_l1325_c32_cf5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1325_c32_cf5b_cond,
MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue,
MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse,
MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right,
BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output);

-- MUX_uxn_opcodes_h_l1331_c24_7a9d
MUX_uxn_opcodes_h_l1331_c24_7a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1331_c24_7a9d_cond,
MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue,
MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse,
MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output,
 t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output,
 t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output,
 t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output,
 n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output,
 n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output,
 n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output,
 n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output,
 MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output,
 MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_3c26 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_43d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_d125 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_f2e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_41c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b33e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_2be5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_c584 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5cfd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_8a99_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1287_l1338_DUPLICATE_8090_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_d125 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_d125;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_2be5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_2be5;
     VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_c584 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_c584;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5cfd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1330_c3_5cfd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_43d1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_43d1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_f2e0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_f2e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b33e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b33e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_41c9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1309_c3_41c9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_3c26 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_3c26;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_05d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_8a99 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_8a99_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_71ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c6_3ac6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1325_c32_fc21] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_left;
     BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output := BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1311_c11_c533] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_left;
     BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output := BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1333_c11_04f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_3770] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_5404] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_634f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1331_c24_b6a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1327_c11_ef14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_4735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_left;
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output := BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_984c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1325_c32_fc21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c6_3ac6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_634f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_984c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_5404_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_3770_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1311_c11_c533_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_4735_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_05d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_71ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c11_ef14_return_output;
     VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c24_b6a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1333_c11_04f0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1300_l1308_l1323_l1315_DUPLICATE_97a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_fac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1314_l1311_l1307_l1333_DUPLICATE_987b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_8020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1304_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_l1333_DUPLICATE_54f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_8a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1327_l1322_DUPLICATE_8a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1304_l1327_l1299_l1322_l1296_l1319_l1291_l1314_l1311_l1307_DUPLICATE_daa0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1327_c7_d737] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1323_c3_97a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_left;
     BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output := BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1325_c32_b068] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_left;
     BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output := BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1333_c7_072d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1291_c1_7d5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output;

     -- MUX[uxn_opcodes_h_l1331_c24_7a9d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1331_c24_7a9d_cond <= VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_cond;
     MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue <= VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iftrue;
     MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse <= VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output := MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_5983] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1333_c7_072d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1327_c7_d737] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1325_c32_b068_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_5983_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1323_c3_97a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1301_l1316_DUPLICATE_443c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue := VAR_MUX_uxn_opcodes_h_l1331_c24_7a9d_return_output;
     VAR_printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1291_c1_7d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1333_c7_072d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1333_c7_072d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1327_c7_d737] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;

     -- printf_uxn_opcodes_h_l1292_c3_6480[uxn_opcodes_h_l1292_c3_6480] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1292_c3_6480_uxn_opcodes_h_l1292_c3_6480_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1327_c7_d737] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output := result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- t16_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1327_c7_d737] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;

     -- n16_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- MUX[uxn_opcodes_h_l1325_c32_cf5b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1325_c32_cf5b_cond <= VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_cond;
     MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue <= VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iftrue;
     MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse <= VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output := MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue := VAR_MUX_uxn_opcodes_h_l1325_c32_cf5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1327_c7_d737_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- n16_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- t16_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_e116] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e116_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     -- n16_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_4052] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_4052_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_5ffb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5ffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1311_c7_04e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1311_c7_04e5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;
     -- n16_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_e890] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_e890_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_0812] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;

     -- n16_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_0812_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_900a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1299_c7_900a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_283f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_283f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c2_dcfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1287_l1338_DUPLICATE_8090 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1287_l1338_DUPLICATE_8090_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c2_dcfb_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1287_l1338_DUPLICATE_8090_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1287_l1338_DUPLICATE_8090_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
