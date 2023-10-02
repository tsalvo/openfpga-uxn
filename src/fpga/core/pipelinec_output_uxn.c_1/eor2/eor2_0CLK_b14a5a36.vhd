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
-- Submodules: 124
entity eor2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_b14a5a36;
architecture arch of eor2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l834_c6_a8b8]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_b779]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l834_c2_214a]
signal t16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l834_c2_214a]
signal n16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l834_c2_214a]
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l834_c2_214a]
signal tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l835_c3_4ba0[uxn_opcodes_h_l835_c3_4ba0]
signal printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l842_c11_7006]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l842_c7_83a5]
signal t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l842_c7_83a5]
signal n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l842_c7_83a5]
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l842_c7_83a5]
signal tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_6baf]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l846_c7_e935]
signal t16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l846_c7_e935]
signal n16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_e935]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l846_c7_e935]
signal tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_5faa]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l852_c7_6602]
signal t16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l852_c7_6602]
signal n16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l852_c7_6602]
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l852_c7_6602]
signal tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l856_c11_4215]
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l856_c7_2efb]
signal t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l856_c7_2efb]
signal n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l856_c7_2efb]
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l856_c7_2efb]
signal tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l857_c3_7b8f]
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_ec38]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l861_c7_cd0e]
signal tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_455e]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l865_c7_70d4]
signal n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l865_c7_70d4]
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l865_c7_70d4]
signal tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l871_c11_a801]
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l871_c7_a3cc]
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_89df]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_abd6]
signal n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l875_c7_abd6]
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_abd6]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_d74e]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l877_c11_6ec2]
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l880_c32_6cfe]
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l880_c32_71bd]
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l880_c32_21b0]
signal MUX_uxn_opcodes_h_l880_c32_21b0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_21b0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_21b0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_21b0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_81dc]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_f927]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_f927]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_f927]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_f927]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l882_c7_f927]
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l888_c11_6600]
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_35dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_35dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_35dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l888_c7_35dc]
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l891_c34_9bb3]
signal CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l893_c11_440d]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_205b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_205b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8
BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output);

-- t16_MUX_uxn_opcodes_h_l834_c2_214a
t16_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l834_c2_214a_cond,
t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- n16_MUX_uxn_opcodes_h_l834_c2_214a
n16_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l834_c2_214a_cond,
n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a
result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l834_c2_214a
tmp16_MUX_uxn_opcodes_h_l834_c2_214a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond,
tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue,
tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse,
tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

-- printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0
printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0 : entity work.printf_uxn_opcodes_h_l835_c3_4ba0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006
BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output);

-- t16_MUX_uxn_opcodes_h_l842_c7_83a5
t16_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- n16_MUX_uxn_opcodes_h_l842_c7_83a5
n16_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5
result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l842_c7_83a5
tmp16_MUX_uxn_opcodes_h_l842_c7_83a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond,
tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output);

-- t16_MUX_uxn_opcodes_h_l846_c7_e935
t16_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l846_c7_e935_cond,
t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- n16_MUX_uxn_opcodes_h_l846_c7_e935
n16_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l846_c7_e935_cond,
n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935
result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- tmp16_MUX_uxn_opcodes_h_l846_c7_e935
tmp16_MUX_uxn_opcodes_h_l846_c7_e935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond,
tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue,
tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse,
tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa
BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output);

-- t16_MUX_uxn_opcodes_h_l852_c7_6602
t16_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l852_c7_6602_cond,
t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- n16_MUX_uxn_opcodes_h_l852_c7_6602
n16_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l852_c7_6602_cond,
n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602
result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- tmp16_MUX_uxn_opcodes_h_l852_c7_6602
tmp16_MUX_uxn_opcodes_h_l852_c7_6602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond,
tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue,
tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse,
tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215
BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output);

-- t16_MUX_uxn_opcodes_h_l856_c7_2efb
t16_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- n16_MUX_uxn_opcodes_h_l856_c7_2efb
n16_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb
result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l856_c7_2efb
tmp16_MUX_uxn_opcodes_h_l856_c7_2efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond,
tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue,
tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse,
tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f
BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left,
BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right,
BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output);

-- n16_MUX_uxn_opcodes_h_l861_c7_cd0e
n16_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e
result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e
tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond,
tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e
BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output);

-- n16_MUX_uxn_opcodes_h_l865_c7_70d4
n16_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4
result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l865_c7_70d4
tmp16_MUX_uxn_opcodes_h_l865_c7_70d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond,
tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801
BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output);

-- n16_MUX_uxn_opcodes_h_l871_c7_a3cc
n16_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc
tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond,
tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df
BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_abd6
n16_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6
result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_abd6
tmp16_MUX_uxn_opcodes_h_l875_c7_abd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e
BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2
BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe
BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left,
BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right,
BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd
BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left,
BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right,
BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output);

-- MUX_uxn_opcodes_h_l880_c32_21b0
MUX_uxn_opcodes_h_l880_c32_21b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l880_c32_21b0_cond,
MUX_uxn_opcodes_h_l880_c32_21b0_iftrue,
MUX_uxn_opcodes_h_l880_c32_21b0_iffalse,
MUX_uxn_opcodes_h_l880_c32_21b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc
BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927
result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600
BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc
result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3
CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x,
CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d
BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0
CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output,
 t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output,
 t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output,
 t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output,
 t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output,
 t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output,
 n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output,
 n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output,
 n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output,
 BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output,
 MUX_uxn_opcodes_h_l880_c32_21b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output,
 CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_64ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7927 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_490c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_8b17 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_8601 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_bd6c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_7c85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_46f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_abd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_21b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_21b0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_62ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_4238_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ee85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_16be_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_d4de_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l898_l830_DUPLICATE_094c_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_46f5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_46f5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_8601 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_8601;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_64ad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_64ad;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7927 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7927;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_490c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_490c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_bd6c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_bd6c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_8b17 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_8b17;
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_62ac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_62ac;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_7c85 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_7c85;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ee85 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ee85;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l880_c32_6cfe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_left;
     BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output := BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l856_c11_4215] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_left;
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output := BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_89df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l842_c11_7006] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_214a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_ec38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c11_440d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_abd6_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c6_a8b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_5faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_81dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l871_c11_a801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_left;
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output := BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_d4de LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_d4de_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l891_c34_9bb3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output := CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l886_c24_4238] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_4238_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_6baf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_455e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l888_c11_6600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_left;
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output := BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_6cfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_a8b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_7006_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6baf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_5faa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_4215_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ec38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_455e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_a801_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_89df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_6600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_440d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_5c05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_4238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_eaae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_336d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_2932_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_74fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_d4de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_d4de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_841d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_214a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_abd6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l891_c24_16be] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_16be_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_9bb3_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_35dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l857_c3_7b8f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_left;
     BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output := BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_b779] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_f927] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_205b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l880_c32_71bd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_left;
     BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output := BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_d74e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_205b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l880_c32_21b0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_71bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_7b8f_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_d74e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_16be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l848_l867_DUPLICATE_f5b0_return_output;
     VAR_printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_b779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_205b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_f927_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_205b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_f927] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output;

     -- t16_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- MUX[uxn_opcodes_h_l880_c32_21b0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l880_c32_21b0_cond <= VAR_MUX_uxn_opcodes_h_l880_c32_21b0_cond;
     MUX_uxn_opcodes_h_l880_c32_21b0_iftrue <= VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iftrue;
     MUX_uxn_opcodes_h_l880_c32_21b0_iffalse <= VAR_MUX_uxn_opcodes_h_l880_c32_21b0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l880_c32_21b0_return_output := MUX_uxn_opcodes_h_l880_c32_21b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l888_c7_35dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_35dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;

     -- printf_uxn_opcodes_h_l835_c3_4ba0[uxn_opcodes_h_l835_c3_4ba0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l835_c3_4ba0_uxn_opcodes_h_l835_c3_4ba0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_35dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l877_c11_6ec2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_left;
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output := BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_6ec2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue := VAR_MUX_uxn_opcodes_h_l880_c32_21b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_f927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_35dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_t16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_f927] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l882_c7_f927] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_cond;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output := result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output;

     -- n16_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- t16_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output := t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_f927] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_f927_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_f927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_f927_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_t16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     -- n16_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output := t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_abd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_abd6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- t16_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_a3cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a3cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     -- t16_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output := t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_70d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_n16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_70d4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- n16_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output := n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_cd0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_n16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_cd0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output := tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- n16_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output := n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_2efb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_2efb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- n16_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output := tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_6602] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_6602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_e935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- n16_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output := n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_e935_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output := tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_83a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_83a5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_214a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_214a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l898_l830_DUPLICATE_094c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l898_l830_DUPLICATE_094c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_214a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_214a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l898_l830_DUPLICATE_094c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l898_l830_DUPLICATE_094c_return_output;
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
