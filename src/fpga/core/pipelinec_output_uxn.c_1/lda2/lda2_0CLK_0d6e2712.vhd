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
-- Submodules: 82
entity lda2_0CLK_0d6e2712 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_0d6e2712;
architecture arch of lda2_0CLK_0d6e2712 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1670_c6_b02b]
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1670_c1_0c21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1670_c2_f13f]
signal t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1671_c3_466b[uxn_opcodes_h_l1671_c3_466b]
signal printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_64a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1675_c7_20f8]
signal t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1678_c11_6011]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1678_c7_3831]
signal tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1678_c7_3831]
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c7_3831]
signal t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1680_c3_c46e]
signal CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_0a5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1682_c7_65da]
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_65da]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1682_c7_65da]
signal t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1683_c3_a773]
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1685_c30_3bea]
signal sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_cef1]
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1688_c7_544b]
signal tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1688_c7_544b]
signal result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1690_c22_9def]
signal BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_11c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1692_c7_4571]
signal tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1692_c7_4571]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_4571]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_4571]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1692_c7_4571]
signal result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1694_c3_69b9]
signal CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_a396]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_3e48]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_3e48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_3e48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_3e48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_3e48]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1697_c3_263b]
signal BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_3158]
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1702_c7_698d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1702_c7_698d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_698d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_698d]
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1704_c31_b840]
signal CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_2986]
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_124c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_124c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ff87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
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
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left,
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right,
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f
tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f
result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f
result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- t16_MUX_uxn_opcodes_h_l1670_c2_f13f
t16_MUX_uxn_opcodes_h_l1670_c2_f13f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond,
t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue,
t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse,
t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

-- printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b
printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b : entity work.printf_uxn_opcodes_h_l1671_c3_466b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8
tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- t16_MUX_uxn_opcodes_h_l1675_c7_20f8
t16_MUX_uxn_opcodes_h_l1675_c7_20f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond,
t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue,
t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse,
t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1678_c7_3831
tmp16_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831
result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831
result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c7_3831
t16_MUX_uxn_opcodes_h_l1678_c7_3831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond,
t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e
CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x,
CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1682_c7_65da
tmp16_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- t16_MUX_uxn_opcodes_h_l1682_c7_65da
t16_MUX_uxn_opcodes_h_l1682_c7_65da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond,
t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue,
t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse,
t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773
BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left,
BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right,
BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea
sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins,
sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x,
sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y,
sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1688_c7_544b
tmp16_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b
result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b
result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def
BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left,
BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right,
BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1692_c7_4571
tmp16_MUX_uxn_opcodes_h_l1692_c7_4571 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond,
tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue,
tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse,
tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571
result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond,
result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9
CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x,
CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48
tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b
BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left,
BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right,
BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1704_c31_b840
CONST_SR_8_uxn_opcodes_h_l1704_c31_b840 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x,
CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output,
 tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output,
 tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output,
 CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output,
 sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output,
 CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1672_c3_42ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_f624 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1690_c3_4548 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_a1d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1700_c21_47b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_0f75 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c21_fdec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1679_l1683_DUPLICATE_1bdd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1693_l1697_DUPLICATE_b4ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1666_l1711_DUPLICATE_8aa9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1672_c3_42ff := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1672_c3_42ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_f624 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_f624;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_0f75 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_0f75;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_a1d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_a1d3;
     VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c11_6011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_3158] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_left;
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output := BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_a396] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_11c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1679_l1683_DUPLICATE_1bdd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1679_l1683_DUPLICATE_1bdd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_64a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1693_l1697_DUPLICATE_b4ad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1693_l1697_DUPLICATE_b4ad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_cef1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1685_c30_3bea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_ins;
     sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_x;
     sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output := sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1690_c22_9def] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1670_c6_b02b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1704_c31_b840] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output := CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_2986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_left;
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output := BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_0a5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_b02b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_64a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_6011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_0a5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_11c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_3158_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_2986_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1690_c3_4548 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1690_c22_9def_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1679_l1683_DUPLICATE_1bdd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1679_l1683_DUPLICATE_1bdd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1693_l1697_DUPLICATE_b4ad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1693_l1697_DUPLICATE_b4ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1675_l1678_l1670_l1682_DUPLICATE_395e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_90ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1696_l1692_l1688_l1682_DUPLICATE_1d70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1675_l1688_l1678_l1670_DUPLICATE_efef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1678_l1706_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_663c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1678_l1702_l1692_l1688_l1682_DUPLICATE_56de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1678_l1675_l1702_l1670_l1692_l1688_l1682_DUPLICATE_f870_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1685_c30_3bea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1690_c3_4548;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1702_c7_698d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1694_c3_69b9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output := CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1680_c3_c46e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output := CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_124c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_124c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1697_c3_263b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_left;
     BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output := BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1704_c21_fdec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c21_fdec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1704_c31_b840_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1670_c1_0c21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1683_c3_a773] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_left;
     BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output := BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_a773_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c21_fdec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1680_c3_c46e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1694_c3_69b9_return_output;
     VAR_printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_0c21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_124c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_124c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1700_c21_47b2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1700_c21_47b2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1697_c3_263b_return_output);

     -- printf_uxn_opcodes_h_l1671_c3_466b[uxn_opcodes_h_l1671_c3_466b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1671_c3_466b_uxn_opcodes_h_l1671_c3_466b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_3e48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1702_c7_698d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_3e48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_698d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_698d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1700_c21_47b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_698d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_3e48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1692_c7_4571] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_cond;
     tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output := tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_3e48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_3e48] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_4571] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_3e48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1692_c7_4571] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_4571] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;

     -- t16_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1692_c7_4571] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output := result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1692_c7_4571_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1688_c7_544b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1688_c7_544b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_65da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_65da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c7_3831] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c7_3831_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1675_c7_20f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_20f8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c2_f13f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1666_l1711_DUPLICATE_8aa9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1666_l1711_DUPLICATE_8aa9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ff87(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1670_c2_f13f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1666_l1711_DUPLICATE_8aa9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1666_l1711_DUPLICATE_8aa9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
