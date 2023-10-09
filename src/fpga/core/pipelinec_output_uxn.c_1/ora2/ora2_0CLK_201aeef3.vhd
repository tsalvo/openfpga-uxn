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
-- BIN_OP_EQ[uxn_opcodes_h_l1147_c6_66e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1147_c1_6f60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c2_38bb]
signal n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1148_c3_3d05[uxn_opcodes_h_l1148_c3_3d05]
signal printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_8267]
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1153_c7_973e]
signal t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_973e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1153_c7_973e]
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1153_c7_973e]
signal n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_7737]
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1156_c7_1aca]
signal n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_cf59]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1161_c7_8dbb]
signal n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_07b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1164_c7_7233]
signal t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_7233]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1164_c7_7233]
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1164_c7_7233]
signal n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1165_c3_ce55]
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_6fd6]
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1168_c7_a63e]
signal n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_40aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_df58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1171_c7_df58]
signal tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1171_c7_df58]
signal n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_d35d]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1176_c7_3e0c]
signal n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_9c61]
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_1366]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1179_c7_1366]
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1179_c7_1366]
signal n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1180_c3_978f]
signal BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1181_c11_5014]
signal BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1184_c32_78a6]
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1184_c32_b63c]
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1184_c32_2e64]
signal MUX_uxn_opcodes_h_l1184_c32_2e64_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_2e64_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_7d56]
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_3483]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_3483]
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_3483]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_3483]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_3483]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_503f]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_889b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1192_c7_889b]
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_889b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_889b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1194_c34_5c3a]
signal CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1196_c11_ed13]
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1196_c7_9522]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1196_c7_9522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1
BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c2_38bb
t16_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb
result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb
tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c2_38bb
n16_MUX_uxn_opcodes_h_l1147_c2_38bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond,
n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

-- printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05
printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05 : entity work.printf_uxn_opcodes_h_l1148_c3_3d05_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output);

-- t16_MUX_uxn_opcodes_h_l1153_c7_973e
t16_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1153_c7_973e
tmp16_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- n16_MUX_uxn_opcodes_h_l1153_c7_973e
n16_MUX_uxn_opcodes_h_l1153_c7_973e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond,
n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue,
n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse,
n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output);

-- t16_MUX_uxn_opcodes_h_l1156_c7_1aca
t16_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca
tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- n16_MUX_uxn_opcodes_h_l1156_c7_1aca
n16_MUX_uxn_opcodes_h_l1156_c7_1aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond,
n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue,
n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse,
n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output);

-- t16_MUX_uxn_opcodes_h_l1161_c7_8dbb
t16_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb
tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- n16_MUX_uxn_opcodes_h_l1161_c7_8dbb
n16_MUX_uxn_opcodes_h_l1161_c7_8dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond,
n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue,
n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse,
n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1164_c7_7233
t16_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1164_c7_7233
tmp16_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- n16_MUX_uxn_opcodes_h_l1164_c7_7233
n16_MUX_uxn_opcodes_h_l1164_c7_7233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond,
n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue,
n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse,
n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55
BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left,
BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right,
BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e
result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e
tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- n16_MUX_uxn_opcodes_h_l1168_c7_a63e
n16_MUX_uxn_opcodes_h_l1168_c7_a63e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond,
n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue,
n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse,
n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1171_c7_df58
tmp16_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- n16_MUX_uxn_opcodes_h_l1171_c7_df58
n16_MUX_uxn_opcodes_h_l1171_c7_df58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond,
n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue,
n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse,
n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c
tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- n16_MUX_uxn_opcodes_h_l1176_c7_3e0c
n16_MUX_uxn_opcodes_h_l1176_c7_3e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond,
n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue,
n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse,
n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1179_c7_1366
tmp16_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- n16_MUX_uxn_opcodes_h_l1179_c7_1366
n16_MUX_uxn_opcodes_h_l1179_c7_1366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond,
n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue,
n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse,
n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f
BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left,
BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right,
BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014
BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left,
BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right,
BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6
BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c
BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output);

-- MUX_uxn_opcodes_h_l1184_c32_2e64
MUX_uxn_opcodes_h_l1184_c32_2e64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1184_c32_2e64_cond,
MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue,
MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse,
MUX_uxn_opcodes_h_l1184_c32_2e64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a
CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x,
CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13
BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left,
BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right,
BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output,
 t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output,
 t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output,
 t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output,
 t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output,
 MUX_uxn_opcodes_h_l1184_c32_2e64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_35e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_c8f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_1a71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_ad06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_77ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_496e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_dd0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_110e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_ca8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1190_c24_324f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_c3cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1194_c24_12d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1192_l1179_DUPLICATE_131f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1143_l1201_DUPLICATE_6840_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_77ba := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_77ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_1a71 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_1a71;
     VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_c8f7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_c8f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_35e0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_35e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_496e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_496e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_dd0d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_dd0d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_ca8c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_ca8c;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_ad06 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_ad06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_110e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_110e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_c3cf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_c3cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_7737] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_left;
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output := BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_cf59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_d35d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_8267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_left;
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output := BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1184_c32_78a6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_left;
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output := BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_7d56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_left;
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output := BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1190_c24_324f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1190_c24_324f_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_9c61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1196_c11_ed13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1192_l1179_DUPLICATE_131f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1192_l1179_DUPLICATE_131f_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1194_c34_5c3a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output := CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_07b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_40aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_503f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_6fd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c6_66e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_78a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c6_66e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_8267_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_7737_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_cf59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_07b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_6fd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_40aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d35d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_9c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_7d56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_503f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1196_c11_ed13_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1172_l1165_l1180_DUPLICATE_eafd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1190_c24_324f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_8950_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1186_l1156_l1179_l1153_l1176_l1171_l1168_l1196_DUPLICATE_86c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1164_l1161_l1186_l1156_l1153_l1176_l1147_l1171_l1168_DUPLICATE_dcc0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1164_l1161_l1156_l1179_l1153_l1176_l1171_l1168_DUPLICATE_796e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_l1196_DUPLICATE_c142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1192_l1179_DUPLICATE_131f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1192_l1179_DUPLICATE_131f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1164_l1192_l1161_l1156_l1179_l1153_l1176_l1147_l1171_l1168_DUPLICATE_4c2d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1147_c1_6f60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1165_c3_ce55] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_left;
     BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output := BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_889b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1196_c7_9522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1196_c7_9522] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1180_c3_978f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_left;
     BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output := BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_3483] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1194_c24_12d2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1194_c24_12d2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1194_c34_5c3a_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1184_c32_b63c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_left;
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output := BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_b63c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_ce55_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1180_c3_978f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1194_c24_12d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1173_l1158_DUPLICATE_0fc9_return_output;
     VAR_printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1147_c1_6f60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1196_c7_9522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1196_c7_9522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;
     -- MUX[uxn_opcodes_h_l1184_c32_2e64] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1184_c32_2e64_cond <= VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_cond;
     MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue <= VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iftrue;
     MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse <= VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_return_output := MUX_uxn_opcodes_h_l1184_c32_2e64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- printf_uxn_opcodes_h_l1148_c3_3d05[uxn_opcodes_h_l1148_c3_3d05] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1148_c3_3d05_uxn_opcodes_h_l1148_c3_3d05_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_889b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_3483] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;

     -- t16_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1192_c7_889b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_889b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1181_c11_5014] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_left;
     BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output := BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c11_5014_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue := VAR_MUX_uxn_opcodes_h_l1184_c32_2e64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_889b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- n16_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- t16_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_3483] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_3483] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output := result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_3483] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_3483_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- t16_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_1366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_1366_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_3e0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_3e0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- t16_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1171_c7_df58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output := result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_df58_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1168_c7_a63e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_a63e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_7233] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_7233_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- n16_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_8dbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_8dbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_1aca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_1aca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_973e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_973e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1147_c2_38bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1143_l1201_DUPLICATE_6840 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1143_l1201_DUPLICATE_6840_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c2_38bb_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1143_l1201_DUPLICATE_6840_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1143_l1201_DUPLICATE_6840_return_output;
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
