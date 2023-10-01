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
-- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_6444]
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_82fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1269_c2_4059]
signal n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1269_c2_4059]
signal t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1269_c2_4059]
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_4059]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1270_c3_596d[uxn_opcodes_h_l1270_c3_596d]
signal printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_a500]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_78e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_3ad3]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_f2ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_cd2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1287_c7_9271]
signal n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1287_c7_9271]
signal t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1287_c7_9271]
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_9271]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_d974]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_570f]
signal n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_570f]
signal t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1291_c7_570f]
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_570f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1292_c3_7c5d]
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_c0c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_1958]
signal n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1296_c7_1958]
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_1958]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_e662]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_179e]
signal n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1300_c7_179e]
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_179e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_d6e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1306_c7_e134]
signal n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1306_c7_e134]
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_e134]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_9beb]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_e512]
signal n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1310_c7_e512]
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_e512]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1311_c3_1364]
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_5c58]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1315_c32_1220]
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1315_c32_cd4f]
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1315_c32_7d9b]
signal MUX_uxn_opcodes_h_l1315_c32_7d9b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_833e]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_a964]
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_a964]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_a964]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_a964]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_a964]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_52d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_9aea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_9aea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_9aea]
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_9aea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1326_c34_ff57]
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_d36d]
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_2307]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_2307]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1269_c2_4059
n16_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- t16_MUX_uxn_opcodes_h_l1269_c2_4059
t16_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1269_c2_4059
tmp16_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

-- printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d
printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d : entity work.printf_uxn_opcodes_h_l1270_c3_596d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c7_78e4
n16_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c7_78e4
t16_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4
tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output);

-- n16_MUX_uxn_opcodes_h_l1281_c7_f2ce
n16_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- t16_MUX_uxn_opcodes_h_l1281_c7_f2ce
t16_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce
tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output);

-- n16_MUX_uxn_opcodes_h_l1287_c7_9271
n16_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- t16_MUX_uxn_opcodes_h_l1287_c7_9271
t16_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1287_c7_9271
tmp16_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_570f
n16_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_570f
t16_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1291_c7_570f
tmp16_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d
BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_1958
n16_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1296_c7_1958
tmp16_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_179e
n16_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1300_c7_179e
tmp16_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output);

-- n16_MUX_uxn_opcodes_h_l1306_c7_e134
n16_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1306_c7_e134
tmp16_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_e512
n16_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1310_c7_e512
tmp16_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364
BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f
BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output);

-- MUX_uxn_opcodes_h_l1315_c32_7d9b
MUX_uxn_opcodes_h_l1315_c32_7d9b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1315_c32_7d9b_cond,
MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue,
MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse,
MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57
CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x,
CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22
CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output,
 n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output,
 n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output,
 n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output,
 n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output,
 MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output,
 CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_64ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_57b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_a2aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_6d64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_da9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_ba29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_56cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_aa83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1312_c3_af37 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_e512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_3065 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_1e1e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e096 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_92f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1310_l1323_DUPLICATE_7966_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1265_l1333_DUPLICATE_22ce_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_6d64 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_6d64;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e096 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e096;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_64ba := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_64ba;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right := to_unsigned(9, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_3065 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_3065;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_56cb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_56cb;
     VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_ba29 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_ba29;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_57b9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_57b9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_da9c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_da9c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_aa83 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_aa83;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_a2aa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_a2aa;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_4059_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_52d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_cd2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_d6e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1310_l1323_DUPLICATE_7966 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1310_l1323_DUPLICATE_7966_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_6444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_left;
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output := BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_9beb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1326_c34_ff57] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output := CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1315_c32_1220] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_left;
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output := BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_a500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_833e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_3ad3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_c0c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_e662] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_d974] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1321_c24_1e1e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_1e1e_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_d36d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_e512_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_1220_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_6444_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_a500_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_3ad3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_cd2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_d974_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_c0c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_e662_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_d6e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_9beb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_833e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_52d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_d36d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_8947_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_1e1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1310_l1277_l1306_l1269_l1300_DUPLICATE_bbc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1323_l1310_l1277_l1317_l1306_l1300_DUPLICATE_665d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1277_l1317_l1306_l1269_l1300_DUPLICATE_b465_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1328_l1281_l1310_l1277_l1306_l1300_DUPLICATE_9bf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1310_l1323_DUPLICATE_7966_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1310_l1323_DUPLICATE_7966_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1296_l1291_l1287_l1281_l1323_l1310_l1277_l1306_l1269_l1300_DUPLICATE_d9d1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_4059_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_e512_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_a964] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_9aea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1326_c24_92f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_92f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ff57_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_2307] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1315_c32_cd4f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_left;
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output := BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_2307] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_82fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1292_c3_7c5d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_left;
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output := BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1311_c3_1364] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_left;
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output := BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_cd4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_7c5d_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_1364_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_92f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1283_l1302_DUPLICATE_fe22_return_output;
     VAR_printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_2307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_2307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_5c58] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_9aea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;

     -- printf_uxn_opcodes_h_l1270_c3_596d[uxn_opcodes_h_l1270_c3_596d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1270_c3_596d_uxn_opcodes_h_l1270_c3_596d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_9aea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- MUX[uxn_opcodes_h_l1315_c32_7d9b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1315_c32_7d9b_cond <= VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_cond;
     MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue <= VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iftrue;
     MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse <= VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output := MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_9aea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_a964] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1312_c3_af37 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_5c58_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_MUX_uxn_opcodes_h_l1315_c32_7d9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_9aea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue := VAR_tmp16_uxn_opcodes_h_l1312_c3_af37;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- n16_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- t16_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_a964] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output := result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_a964] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_a964] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_a964_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_e512] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_e512_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_e134] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e134_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_179e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_179e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_1958] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output := result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_1958_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- n16_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_570f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_570f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_9271] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_9271_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_f2ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_f2ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_78e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_78e4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_4059] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1265_l1333_DUPLICATE_22ce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1265_l1333_DUPLICATE_22ce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_4059_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_4059_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1265_l1333_DUPLICATE_22ce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1265_l1333_DUPLICATE_22ce_return_output;
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
