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
-- Submodules: 111
entity swp2_0CLK_27acc40e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_27acc40e;
architecture arch of swp2_0CLK_27acc40e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2750_c6_9de7]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_f03a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2750_c2_a674]
signal n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c2_a674]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2750_c2_a674]
signal t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2751_c3_4c4c[uxn_opcodes_h_l2751_c3_4c4c]
signal printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_461d]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2755_c7_0b11]
signal t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_3826]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2758_c7_1617]
signal n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_1617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2758_c7_1617]
signal t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_1bda]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2763_c7_7122]
signal n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_7122]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2763_c7_7122]
signal t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_83b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2766_c7_6ff6]
signal t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2767_c3_3595]
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_8db0]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2770_c7_7653]
signal n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_7653]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_2219]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2773_c7_2542]
signal n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_2542]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3afb]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_bbc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_274e]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_62e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2782_c3_7a76]
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2784_c30_b849]
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_809a]
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_a196]
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_a196]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_a196]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2789_c7_a196]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_a196]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2792_c31_d8b2]
signal CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_224d]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_db4e]
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_db4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_db4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_db4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_db4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_9c9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_5293]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_5293]
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_5293]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_5293]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2801_c31_6b7d]
signal CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2803_c11_b061]
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2803_c7_ea04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2803_c7_ea04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output);

-- n16_MUX_uxn_opcodes_h_l2750_c2_a674
n16_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- t16_MUX_uxn_opcodes_h_l2750_c2_a674
t16_MUX_uxn_opcodes_h_l2750_c2_a674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond,
t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue,
t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse,
t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

-- printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c
printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c : entity work.printf_uxn_opcodes_h_l2751_c3_4c4c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output);

-- n16_MUX_uxn_opcodes_h_l2755_c7_0b11
n16_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- t16_MUX_uxn_opcodes_h_l2755_c7_0b11
t16_MUX_uxn_opcodes_h_l2755_c7_0b11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond,
t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue,
t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse,
t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output);

-- n16_MUX_uxn_opcodes_h_l2758_c7_1617
n16_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- t16_MUX_uxn_opcodes_h_l2758_c7_1617
t16_MUX_uxn_opcodes_h_l2758_c7_1617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond,
t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue,
t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse,
t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output);

-- n16_MUX_uxn_opcodes_h_l2763_c7_7122
n16_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- t16_MUX_uxn_opcodes_h_l2763_c7_7122
t16_MUX_uxn_opcodes_h_l2763_c7_7122 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond,
t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue,
t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse,
t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output);

-- n16_MUX_uxn_opcodes_h_l2766_c7_6ff6
n16_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- t16_MUX_uxn_opcodes_h_l2766_c7_6ff6
t16_MUX_uxn_opcodes_h_l2766_c7_6ff6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond,
t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue,
t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse,
t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595
BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left,
BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right,
BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output);

-- n16_MUX_uxn_opcodes_h_l2770_c7_7653
n16_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output);

-- n16_MUX_uxn_opcodes_h_l2773_c7_2542
n16_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output);

-- n16_MUX_uxn_opcodes_h_l2778_c7_bbc4
n16_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output);

-- n16_MUX_uxn_opcodes_h_l2781_c7_62e4
n16_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76
BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left,
BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right,
BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2784_c30_b849
sp_relative_shift_uxn_opcodes_h_l2784_c30_b849 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins,
sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x,
sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y,
sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2
CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x,
CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d
CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x,
CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left,
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right,
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447
CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output,
 n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output,
 n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output,
 n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output,
 n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output,
 n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output,
 n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output,
 n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output,
 n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output,
 n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output,
 sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output,
 CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output,
 CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a426 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_8da8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_133d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_e603 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_e16a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_47be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_8a49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_983c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_7139 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_6e22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_1b02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_bdd3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_0273 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_47f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_e511 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_5293_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_7678_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2746_l2808_DUPLICATE_709d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_8da8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_8da8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a426 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a426;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_7139 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_7139;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_8a49 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_8a49;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_e16a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_e16a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_0273 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_0273;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_47be := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_47be;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_1b02 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_1b02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_e603 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_e603;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_e511 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_e511;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_983c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_983c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_133d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_133d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_8db0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_461d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2799_c7_5293] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_5293_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_809a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2797_c21_47f0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_47f0_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2784_c30_b849] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_ins;
     sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_x;
     sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output := sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_224d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_9c9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2792_c31_d8b2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output := CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2803_c11_b061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_left;
     BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output := BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2801_c31_6b7d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output := CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_83b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_3826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c6_9de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_2219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_274e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_1bda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3afb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_9de7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_461d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_3826_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_1bda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_83b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_8db0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2219_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3afb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_274e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_809a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_224d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9c9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_b061_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2782_l2759_l2774_DUPLICATE_1cd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_47f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2763_l2758_l2781_DUPLICATE_3137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2755_l2778_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_DUPLICATE_ae14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2766_l2794_l2763_l2758_DUPLICATE_4131_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_DUPLICATE_24ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2778_l2750_l2773_l2770_l2799_l2766_l2763_l2758_DUPLICATE_ad67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_5293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_b849_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2792_c21_bdd3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_bdd3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_d8b2_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_5293] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2767_c3_3595] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_left;
     BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output := BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_f03a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_db4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2803_c7_ea04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2801_c21_7678] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_7678_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_6b7d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2803_c7_ea04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2782_c3_7a76] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_left;
     BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output := BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_3595_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_bdd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_7678_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2760_l2775_DUPLICATE_a447_return_output;
     VAR_printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f03a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_ea04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;
     -- t16_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2787_c21_6e22] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_6e22_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_7a76_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_db4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2789_c7_a196] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;

     -- printf_uxn_opcodes_h_l2751_c3_4c4c[uxn_opcodes_h_l2751_c3_4c4c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2751_c3_4c4c_uxn_opcodes_h_l2751_c3_4c4c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_5293] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_5293] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_5293] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output := result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_6e22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_5293_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_a196] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_db4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_db4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_db4e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- n16_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_db4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_a196] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_a196] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output := result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;

     -- t16_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_a196] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a196_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- t16_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_62e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_62e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_bbc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_bbc4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;
     -- n16_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_2542] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_2542_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2770_c7_7653] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output := result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_7653_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_6ff6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_6ff6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- n16_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_7122] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output := result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_7122_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_1617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_1617_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c7_0b11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_0b11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c2_a674] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2746_l2808_DUPLICATE_709d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2746_l2808_DUPLICATE_709d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a674_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a674_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2746_l2808_DUPLICATE_709d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2746_l2808_DUPLICATE_709d_return_output;
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
