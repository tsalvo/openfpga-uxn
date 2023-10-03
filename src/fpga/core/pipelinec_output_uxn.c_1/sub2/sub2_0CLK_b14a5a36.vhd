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
entity sub2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_b14a5a36;
architecture arch of sub2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_17c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_609d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1615_c2_540e]
signal n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1615_c2_540e]
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1615_c2_540e]
signal t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_540e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1616_c3_7a17[uxn_opcodes_h_l1616_c3_7a17]
signal printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_5574]
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_a14a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_3d59]
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1627_c7_a620]
signal n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1627_c7_a620]
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1627_c7_a620]
signal t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_a620]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_8850]
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_9c99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_ec60]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_8b5d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1638_c3_ece1]
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_3cc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_0297]
signal n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1642_c7_0297]
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_0297]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_3519]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c7_0924]
signal n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1646_c7_0924]
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_0924]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_f7b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_d57a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_9d22]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_8b3b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1657_c3_99b1]
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_6b25]
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1661_c32_eaf2]
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1661_c32_c317]
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1661_c32_fa69]
signal MUX_uxn_opcodes_h_l1661_c32_fa69_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_fa69_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_8602]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_590f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_590f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_590f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_590f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_590f]
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_acb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_19a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_19a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_19a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_19a8]
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1672_c34_d8ae]
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_7bc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_3ab8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_3ab8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output);

-- n16_MUX_uxn_opcodes_h_l1615_c2_540e
n16_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1615_c2_540e
tmp16_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- t16_MUX_uxn_opcodes_h_l1615_c2_540e
t16_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

-- printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17
printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17 : entity work.printf_uxn_opcodes_h_l1616_c3_7a17_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output);

-- n16_MUX_uxn_opcodes_h_l1623_c7_a14a
n16_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a
tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- t16_MUX_uxn_opcodes_h_l1623_c7_a14a
t16_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output);

-- n16_MUX_uxn_opcodes_h_l1627_c7_a620
n16_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1627_c7_a620
tmp16_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- t16_MUX_uxn_opcodes_h_l1627_c7_a620
t16_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output);

-- n16_MUX_uxn_opcodes_h_l1633_c7_9c99
n16_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99
tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- t16_MUX_uxn_opcodes_h_l1633_c7_9c99
t16_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c7_8b5d
n16_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d
tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- t16_MUX_uxn_opcodes_h_l1637_c7_8b5d
t16_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1
BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_0297
n16_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1642_c7_0297
tmp16_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c7_0924
n16_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1646_c7_0924
tmp16_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output);

-- n16_MUX_uxn_opcodes_h_l1652_c7_d57a
n16_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a
tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_8b3b
n16_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b
tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1
BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2
BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317
BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output);

-- MUX_uxn_opcodes_h_l1661_c32_fa69
MUX_uxn_opcodes_h_l1661_c32_fa69 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1661_c32_fa69_cond,
MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue,
MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse,
MUX_uxn_opcodes_h_l1661_c32_fa69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae
CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x,
CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output,
 n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output,
 n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output,
 n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output,
 n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output,
 n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output,
 MUX_uxn_opcodes_h_l1661_c32_fa69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_0b9f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_6a8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_ac00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_6477 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_898f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_744d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_7e46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_e22d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_8b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_628e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_8419_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_2bc2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_37df_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_21ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1611_l1679_DUPLICATE_1c78_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_6477 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_6477;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_6a8e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_6a8e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_0b9f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_0b9f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_7e46 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_7e46;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_628e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_628e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_2bc2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_2bc2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_744d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_744d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_e22d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_e22d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_898f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_898f;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_ac00 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_ac00;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_17c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_f7b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_ec60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_7bc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_3519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_acb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_8602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1672_c34_d8ae] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output := CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_8850] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_left;
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output := BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_21ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_21ae_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1661_c32_eaf2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_left;
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output := BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_9d22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_5574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_left;
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output := BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_540e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_3d59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1667_c24_8419] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_8419_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_3cc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_8b3b_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_eaf2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_17c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_5574_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_3d59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_8850_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_ec60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cc1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3519_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_f7b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_9d22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_acb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_7bc1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1657_l1638_l1628_l1647_DUPLICATE_39a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_8419_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1f38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_29c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_2502_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_dfcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_21ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_21ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_8001_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_540e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1661_c32_c317] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_left;
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output := BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_3ab8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_19a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1657_c3_99b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_left;
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output := BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1672_c24_37df] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_37df_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_d8ae_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_3ab8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_590f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_609d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1638_c3_ece1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_left;
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output := BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_c317_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_ece1_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_99b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_37df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_b50e_return_output;
     VAR_printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_609d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_3ab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_19a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_19a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_19a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- MUX[uxn_opcodes_h_l1661_c32_fa69] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1661_c32_fa69_cond <= VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_cond;
     MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue <= VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iftrue;
     MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse <= VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_return_output := MUX_uxn_opcodes_h_l1661_c32_fa69_return_output;

     -- n16_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_590f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_6b25] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_left;
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output := BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output;

     -- printf_uxn_opcodes_h_l1616_c3_7a17[uxn_opcodes_h_l1616_c3_7a17] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1616_c3_7a17_uxn_opcodes_h_l1616_c3_7a17_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_6b25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue := VAR_MUX_uxn_opcodes_h_l1661_c32_fa69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_19a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_590f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_590f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_590f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_590f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_8b3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_8b3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_d57a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_d57a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- t16_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_0924] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_0924_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_0297] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_0297_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_8b5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_8b5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_9c99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output := result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_9c99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     -- n16_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_a620] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output := result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_a620_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_a14a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_a14a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_540e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1611_l1679_DUPLICATE_1c78 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1611_l1679_DUPLICATE_1c78_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_540e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_540e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1611_l1679_DUPLICATE_1c78_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1611_l1679_DUPLICATE_1c78_return_output;
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
