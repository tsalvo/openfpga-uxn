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
entity mul2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_b14a5a36;
architecture arch of mul2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_97f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_c83f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_1aff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1270_c3_68a4[uxn_opcodes_h_l1270_c3_68a4]
signal printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_0015]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_7a1a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_6f45]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_30b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_09b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1287_c7_4535]
signal n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1287_c7_4535]
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1287_c7_4535]
signal t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_4535]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_853f]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_5897]
signal n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1291_c7_5897]
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_5897]
signal t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_5897]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1292_c3_4ab1]
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_76b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_871b]
signal n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1296_c7_871b]
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_871b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_8342]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_3b08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_086f]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_b4cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_5f03]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_fe0b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1311_c3_64ce]
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_5753]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1315_c32_1036]
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1315_c32_74f2]
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1315_c32_0832]
signal MUX_uxn_opcodes_h_l1315_c32_0832_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_0832_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_0832_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_0832_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_d29d]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_838b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_838b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_838b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_838b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_838b]
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_7fde]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_55fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_55fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_55fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_55fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1326_c34_c7b0]
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_cc8c]
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_d89a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_d89a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output);

-- n16_MUX_uxn_opcodes_h_l1269_c2_1aff
n16_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff
tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- t16_MUX_uxn_opcodes_h_l1269_c2_1aff
t16_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

-- printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4
printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4 : entity work.printf_uxn_opcodes_h_l1270_c3_68a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c7_7a1a
n16_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a
tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c7_7a1a
t16_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output);

-- n16_MUX_uxn_opcodes_h_l1281_c7_30b2
n16_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2
tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- t16_MUX_uxn_opcodes_h_l1281_c7_30b2
t16_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output);

-- n16_MUX_uxn_opcodes_h_l1287_c7_4535
n16_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1287_c7_4535
tmp16_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- t16_MUX_uxn_opcodes_h_l1287_c7_4535
t16_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_5897
n16_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1291_c7_5897
tmp16_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_5897
t16_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1
BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_871b
n16_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1296_c7_871b
tmp16_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_3b08
n16_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08
tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output);

-- n16_MUX_uxn_opcodes_h_l1306_c7_b4cb
n16_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb
tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_fe0b
n16_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b
tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce
BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2
BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output);

-- MUX_uxn_opcodes_h_l1315_c32_0832
MUX_uxn_opcodes_h_l1315_c32_0832 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1315_c32_0832_cond,
MUX_uxn_opcodes_h_l1315_c32_0832_iftrue,
MUX_uxn_opcodes_h_l1315_c32_0832_iffalse,
MUX_uxn_opcodes_h_l1315_c32_0832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0
CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x,
CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output,
 n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output,
 n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output,
 n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output,
 n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output,
 MUX_uxn_opcodes_h_l1315_c32_0832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output,
 CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_232c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_a2d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_cc4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_166e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_aff2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_1ebb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ba3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_0c5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1312_c3_40a0 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_0832_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_0832_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_22d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_6efc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_d12a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_4015_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_ccba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1265_l1333_DUPLICATE_757e_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_0c5c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_0c5c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ba3e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ba3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_d12a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_d12a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_a2d6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_a2d6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_22d8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_22d8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_232c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_232c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_cc4e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_cc4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_1ebb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_1ebb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_166e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_166e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_aff2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_aff2;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_ccba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_ccba_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_fe0b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_8342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_76b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1321_c24_6efc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_6efc_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_0015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1326_c34_c7b0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output := CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_6f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_5f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1315_c32_1036] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_left;
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output := BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_97f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_cc8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_086f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_d29d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_7fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_09b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_1aff_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_853f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1036_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_97f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_0015_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_6f45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_09b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_853f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_76b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_8342_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_086f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_5f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_d29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_7fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc8c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1311_l1292_l1301_DUPLICATE_bce6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_6efc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_210c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_5636_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_4f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_5792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_ccba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_ccba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_1aa2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_1aff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1326_c24_4015] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_4015_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_c7b0_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_d89a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1311_c3_64ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_left;
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output := BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1292_c3_4ab1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_left;
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output := BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1315_c32_74f2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_left;
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output := BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_d89a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_838b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_c83f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_55fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1315_c32_0832_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_74f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_4ab1_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_64ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_4015_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_2f74_return_output;
     VAR_printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_c83f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_d89a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_5753] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_55fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;

     -- MUX[uxn_opcodes_h_l1315_c32_0832] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1315_c32_0832_cond <= VAR_MUX_uxn_opcodes_h_l1315_c32_0832_cond;
     MUX_uxn_opcodes_h_l1315_c32_0832_iftrue <= VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iftrue;
     MUX_uxn_opcodes_h_l1315_c32_0832_iffalse <= VAR_MUX_uxn_opcodes_h_l1315_c32_0832_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1315_c32_0832_return_output := MUX_uxn_opcodes_h_l1315_c32_0832_return_output;

     -- printf_uxn_opcodes_h_l1270_c3_68a4[uxn_opcodes_h_l1270_c3_68a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1270_c3_68a4_uxn_opcodes_h_l1270_c3_68a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_55fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_55fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_838b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1312_c3_40a0 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5753_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_MUX_uxn_opcodes_h_l1315_c32_0832_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_55fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue := VAR_tmp16_uxn_opcodes_h_l1312_c3_40a0;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_838b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_838b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_838b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_838b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_fe0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- t16_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_fe0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_b4cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_b4cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_3b08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_3b08_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- n16_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_871b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_871b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_5897] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_5897_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_4535] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output := result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_4535_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_30b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_30b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_7a1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_7a1a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_1aff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1265_l1333_DUPLICATE_757e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1265_l1333_DUPLICATE_757e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_1aff_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1265_l1333_DUPLICATE_757e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1265_l1333_DUPLICATE_757e_return_output;
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
