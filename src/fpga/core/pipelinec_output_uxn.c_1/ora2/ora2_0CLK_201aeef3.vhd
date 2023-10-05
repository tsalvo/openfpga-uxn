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
-- Submodules: 123
entity ora2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_201aeef3;
architecture arch of ora2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l978_c6_3cff]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l978_c1_61cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l978_c2_2077]
signal n16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c2_2077]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l978_c2_2077]
signal tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l978_c2_2077]
signal t16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l979_c3_e846[uxn_opcodes_h_l979_c3_e846]
signal printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l984_c11_34f9]
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l984_c7_024b]
signal n16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_024b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l984_c7_024b]
signal tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l984_c7_024b]
signal t16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_8d23]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_0055]
signal n16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l987_c7_0055]
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l987_c7_0055]
signal t16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l992_c11_3275]
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l992_c7_2d21]
signal n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l992_c7_2d21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l992_c7_2d21]
signal tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l992_c7_2d21]
signal t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l995_c11_0a28]
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l995_c7_78ab]
signal n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_78ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l995_c7_78ab]
signal tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l995_c7_78ab]
signal t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l996_c3_3e9c]
signal BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_a876]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l999_c7_9bc5]
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_49a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1002_c7_019e]
signal n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1002_c7_019e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1002_c7_019e]
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_9ce4]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1007_c7_c30d]
signal tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_716a]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1010_c7_e4f0]
signal tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1011_c3_5feb]
signal BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1012_c11_1782]
signal BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1015_c32_c766]
signal BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1015_c32_c0ba]
signal BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1015_c32_a6ef]
signal MUX_uxn_opcodes_h_l1015_c32_a6ef_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_d0d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1017_c7_660e]
signal result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1017_c7_660e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1017_c7_660e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1017_c7_660e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1017_c7_660e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_fd94]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_f11f]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_f11f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_f11f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_f11f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1025_c34_38f9]
signal CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_e8fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_2959]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_2959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff
BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output);

-- n16_MUX_uxn_opcodes_h_l978_c2_2077
n16_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l978_c2_2077_cond,
n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077
result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077
result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077
result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077
result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- tmp16_MUX_uxn_opcodes_h_l978_c2_2077
tmp16_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond,
tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- t16_MUX_uxn_opcodes_h_l978_c2_2077
t16_MUX_uxn_opcodes_h_l978_c2_2077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l978_c2_2077_cond,
t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue,
t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse,
t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

-- printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846
printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846 : entity work.printf_uxn_opcodes_h_l979_c3_e846_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9
BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output);

-- n16_MUX_uxn_opcodes_h_l984_c7_024b
n16_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l984_c7_024b_cond,
n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b
result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b
result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l984_c7_024b
tmp16_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond,
tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- t16_MUX_uxn_opcodes_h_l984_c7_024b
t16_MUX_uxn_opcodes_h_l984_c7_024b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l984_c7_024b_cond,
t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue,
t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse,
t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23
BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_0055
n16_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_0055_cond,
n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- tmp16_MUX_uxn_opcodes_h_l987_c7_0055
tmp16_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond,
tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- t16_MUX_uxn_opcodes_h_l987_c7_0055
t16_MUX_uxn_opcodes_h_l987_c7_0055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l987_c7_0055_cond,
t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue,
t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse,
t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275
BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left,
BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right,
BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output);

-- n16_MUX_uxn_opcodes_h_l992_c7_2d21
n16_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21
result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l992_c7_2d21
tmp16_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- t16_MUX_uxn_opcodes_h_l992_c7_2d21
t16_MUX_uxn_opcodes_h_l992_c7_2d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond,
t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue,
t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse,
t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output);

-- n16_MUX_uxn_opcodes_h_l995_c7_78ab
n16_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab
result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l995_c7_78ab
tmp16_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- t16_MUX_uxn_opcodes_h_l995_c7_78ab
t16_MUX_uxn_opcodes_h_l995_c7_78ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond,
t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue,
t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse,
t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c
BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left,
BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right,
BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876
BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output);

-- n16_MUX_uxn_opcodes_h_l999_c7_9bc5
n16_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5
result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5
result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5
tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output);

-- n16_MUX_uxn_opcodes_h_l1002_c7_019e
n16_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e
result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e
result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1002_c7_019e
tmp16_MUX_uxn_opcodes_h_l1002_c7_019e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond,
tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output);

-- n16_MUX_uxn_opcodes_h_l1007_c7_c30d
n16_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d
tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond,
tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output);

-- n16_MUX_uxn_opcodes_h_l1010_c7_e4f0
n16_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0
tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond,
tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb
BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left,
BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right,
BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782
BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left,
BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right,
BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766
BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left,
BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right,
BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba
BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left,
BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right,
BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output);

-- MUX_uxn_opcodes_h_l1015_c32_a6ef
MUX_uxn_opcodes_h_l1015_c32_a6ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1015_c32_a6ef_cond,
MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue,
MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse,
MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e
result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9
CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x,
CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80
CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output,
 n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output,
 n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output,
 n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output,
 n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output,
 n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output,
 n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output,
 n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output,
 n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output,
 MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_d7f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_a7a8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_6d4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_7b66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_d5c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_aa24 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1c10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_2beb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_affc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c24_172f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1024_c3_9927 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1025_c24_68f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_l1010_DUPLICATE_875f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1032_l974_DUPLICATE_2df3_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_d5c6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_d5c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_2beb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_2beb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1024_c3_9927 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1024_c3_9927;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_d7f4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_d7f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_7b66 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_7b66;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_6d4e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_6d4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_aa24 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_aa24;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1c10 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1c10;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_affc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_affc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_a7a8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_a7a8;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_d0d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_fd94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l995_c11_0a28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_left;
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output := BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_9ce4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1025_c34_38f9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output := CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c6_3cff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c24_172f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c24_172f_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_a876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_8d23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_l1010_DUPLICATE_875f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_l1010_DUPLICATE_875f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_e8fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_49a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l992_c11_3275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_left;
     BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output := BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l984_c11_34f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1015_c32_c766] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_left;
     BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output := BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_716a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1015_c32_c766_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_49a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_9ce4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_716a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_d0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fd94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_e8fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c6_3cff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_34f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_8d23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_3275_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0a28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_a876_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l988_l1011_l1003_l996_DUPLICATE_8b22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c24_172f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l992_DUPLICATE_301f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l1027_l995_l1023_l992_l1017_DUPLICATE_9add_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l987_l984_l1007_l978_l1002_l999_l995_l992_l1017_DUPLICATE_ff3c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l1002_l999_l995_l992_DUPLICATE_0e08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l1027_l995_l1023_l992_DUPLICATE_512a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_l1010_DUPLICATE_875f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_l1010_DUPLICATE_875f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l987_l1010_l984_l1007_l978_l1002_l999_l995_l1023_l992_DUPLICATE_5750_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_2959] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1015_c32_c0ba] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_left;
     BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output := BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1011_c3_5feb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_left;
     BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output := BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l996_c3_3e9c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_left;
     BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output := BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_f11f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1025_c24_68f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1025_c24_68f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1025_c34_38f9_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l978_c1_61cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_2959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1017_c7_660e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1015_c32_c0ba_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c3_5feb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l996_c3_3e9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1025_c24_68f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1004_l989_DUPLICATE_0e80_return_output;
     VAR_printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l978_c1_61cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_2959_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_2959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- MUX[uxn_opcodes_h_l1015_c32_a6ef] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1015_c32_a6ef_cond <= VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_cond;
     MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue <= VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iftrue;
     MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse <= VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output := MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1017_c7_660e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;

     -- printf_uxn_opcodes_h_l979_c3_e846[uxn_opcodes_h_l979_c3_e846] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l979_c3_e846_uxn_opcodes_h_l979_c3_e846_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_f11f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_f11f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;

     -- t16_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1012_c11_1782] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_left;
     BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output := BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_f11f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1012_c11_1782_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue := VAR_MUX_uxn_opcodes_h_l1015_c32_a6ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_f11f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1017_c7_660e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;

     -- t16_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1017_c7_660e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1017_c7_660e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1017_c7_660e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_t16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output := t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_e4f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_e4f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- t16_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output := t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_c30d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;

     -- n16_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_c30d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_t16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     -- n16_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- t16_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output := t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1002_c7_019e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1002_c7_019e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- n16_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_9bc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_n16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l999_c7_9bc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- n16_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output := n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_78ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_78ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- n16_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output := n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output := tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l992_c7_2d21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_n16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_2d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     -- n16_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output := n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output := tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0055_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_024b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output := tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_024b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l978_c2_2077_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c2_2077] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1032_l974_DUPLICATE_2df3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1032_l974_DUPLICATE_2df3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c2_2077_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c2_2077_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1032_l974_DUPLICATE_2df3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1032_l974_DUPLICATE_2df3_return_output;
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
