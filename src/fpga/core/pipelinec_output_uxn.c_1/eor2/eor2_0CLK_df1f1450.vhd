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
-- Submodules: 114
entity eor2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_df1f1450;
architecture arch of eor2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1190_c6_5a01]
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1190_c1_aebb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1190_c2_d1ce]
signal t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1191_c3_cf1e[uxn_opcodes_h_l1191_c3_cf1e]
signal printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_aac2]
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1195_c7_97c3]
signal t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1198_c11_8c39]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1198_c7_a554]
signal n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1198_c7_a554]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1198_c7_a554]
signal tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1198_c7_a554]
signal t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_e448]
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1203_c7_3d7e]
signal t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1206_c11_3d1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1206_c7_b609]
signal n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1206_c7_b609]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1206_c7_b609]
signal tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1206_c7_b609]
signal t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1207_c3_db00]
signal BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_120b]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1210_c7_6e69]
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_2df3]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_3340]
signal n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1213_c7_3340]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1213_c7_3340]
signal tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_7666]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_4699]
signal n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_4699]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1218_c7_4699]
signal tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1221_c11_3a9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1221_c7_03d7]
signal tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1222_c3_a092]
signal BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1223_c11_a67d]
signal BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1225_c32_3ea6]
signal BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1225_c32_6fd5]
signal BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1225_c32_caa1]
signal MUX_uxn_opcodes_h_l1225_c32_caa1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1225_c32_caa1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_54d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_cad1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_cad1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_cad1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1227_c7_cad1]
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1227_c7_cad1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_ece8]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_b0ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_b0ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1233_c7_b0ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_b0ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1235_c34_e524]
signal CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_3080]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_2da3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_2da3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01
BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left,
BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right,
BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output);

-- n16_MUX_uxn_opcodes_h_l1190_c2_d1ce
n16_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce
tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- t16_MUX_uxn_opcodes_h_l1190_c2_d1ce
t16_MUX_uxn_opcodes_h_l1190_c2_d1ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond,
t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue,
t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse,
t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

-- printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e
printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e : entity work.printf_uxn_opcodes_h_l1191_c3_cf1e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output);

-- n16_MUX_uxn_opcodes_h_l1195_c7_97c3
n16_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3
tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- t16_MUX_uxn_opcodes_h_l1195_c7_97c3
t16_MUX_uxn_opcodes_h_l1195_c7_97c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond,
t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue,
t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse,
t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39
BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output);

-- n16_MUX_uxn_opcodes_h_l1198_c7_a554
n16_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554
result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1198_c7_a554
tmp16_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- t16_MUX_uxn_opcodes_h_l1198_c7_a554
t16_MUX_uxn_opcodes_h_l1198_c7_a554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond,
t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue,
t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse,
t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output);

-- n16_MUX_uxn_opcodes_h_l1203_c7_3d7e
n16_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e
tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- t16_MUX_uxn_opcodes_h_l1203_c7_3d7e
t16_MUX_uxn_opcodes_h_l1203_c7_3d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond,
t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue,
t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse,
t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c
BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output);

-- n16_MUX_uxn_opcodes_h_l1206_c7_b609
n16_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609
result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609
result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609
result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609
result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609
result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1206_c7_b609
tmp16_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- t16_MUX_uxn_opcodes_h_l1206_c7_b609
t16_MUX_uxn_opcodes_h_l1206_c7_b609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond,
t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue,
t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse,
t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00
BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left,
BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right,
BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_6e69
n16_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69
tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond,
tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue,
tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse,
tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_3340
n16_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340
result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340
result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1213_c7_3340
tmp16_MUX_uxn_opcodes_h_l1213_c7_3340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond,
tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue,
tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse,
tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_4699
n16_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1218_c7_4699
tmp16_MUX_uxn_opcodes_h_l1218_c7_4699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond,
tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue,
tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse,
tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output);

-- n16_MUX_uxn_opcodes_h_l1221_c7_03d7
n16_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7
tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond,
tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092
BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left,
BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right,
BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d
BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left,
BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right,
BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6
BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left,
BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right,
BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5
BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left,
BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right,
BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output);

-- MUX_uxn_opcodes_h_l1225_c32_caa1
MUX_uxn_opcodes_h_l1225_c32_caa1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1225_c32_caa1_cond,
MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue,
MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse,
MUX_uxn_opcodes_h_l1225_c32_caa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1
result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1235_c34_e524
CONST_SR_8_uxn_opcodes_h_l1235_c34_e524 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x,
CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output,
 n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output,
 n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output,
 n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output,
 n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output,
 n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output,
 n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output,
 MUX_uxn_opcodes_h_l1225_c32_caa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output,
 CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_09d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_d6bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_6dcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1204_c3_35ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_7b45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_5d5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_1c62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_8615 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e4c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1231_c24_9ed7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_332f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_e0c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1233_l1221_DUPLICATE_1276_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1186_l1242_DUPLICATE_0151_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_5d5a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_5d5a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_332f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_332f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_d6bf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_d6bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_1c62 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_1c62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_8615 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_8615;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1204_c3_35ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1204_c3_35ea;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_6dcb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_6dcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_09d9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_09d9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_7b45 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_7b45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e4c0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e4c0;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_120b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1233_l1221_DUPLICATE_1276 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1233_l1221_DUPLICATE_1276_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1190_c6_5a01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1225_c32_3ea6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_left;
     BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output := BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_e448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_left;
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output := BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_aac2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_2df3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_54d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_3080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1231_c24_9ed7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1231_c24_9ed7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_7666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1221_c11_3a9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_ece8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c11_8c39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1235_c34_e524] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output := CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1206_c11_3d1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1225_c32_3ea6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c6_5a01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_aac2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c11_8c39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_e448_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1206_c11_3d1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_120b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_2df3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_7666_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_3a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_54d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ece8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_3080_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1199_l1214_l1207_l1222_DUPLICATE_25b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1231_c24_9ed7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1203_DUPLICATE_4d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1213_l1210_l1237_l1206_l1233_l1203_l1227_DUPLICATE_9f42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1195_l1218_l1190_l1213_l1210_l1206_l1203_l1227_DUPLICATE_8da0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1237_l1206_l1233_l1203_DUPLICATE_2cc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1233_l1221_DUPLICATE_1276_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1233_l1221_DUPLICATE_1276_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1198_l1221_l1195_l1218_l1190_l1213_l1210_l1206_l1233_l1203_DUPLICATE_63f7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_b0ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1227_c7_cad1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_2da3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1235_c24_e0c6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_e0c6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1235_c34_e524_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1222_c3_a092] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_left;
     BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output := BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1207_c3_db00] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_left;
     BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output := BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1225_c32_6fd5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_left;
     BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output := BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_2da3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1190_c1_aebb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1225_c32_6fd5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c3_db00_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1222_c3_a092_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_e0c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1200_DUPLICATE_3279_return_output;
     VAR_printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1190_c1_aebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_2da3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;
     -- MUX[uxn_opcodes_h_l1225_c32_caa1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1225_c32_caa1_cond <= VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_cond;
     MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue <= VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iftrue;
     MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse <= VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_return_output := MUX_uxn_opcodes_h_l1225_c32_caa1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_cad1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1223_c11_a67d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_left;
     BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output := BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1233_c7_b0ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;

     -- printf_uxn_opcodes_h_l1191_c3_cf1e[uxn_opcodes_h_l1191_c3_cf1e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1191_c3_cf1e_uxn_opcodes_h_l1191_c3_cf1e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_b0ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_b0ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1223_c11_a67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue := VAR_MUX_uxn_opcodes_h_l1225_c32_caa1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_b0ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_cad1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_cad1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1227_c7_cad1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c7_cad1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1221_c7_03d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_03d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- t16_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_4699] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4699_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- n16_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_3340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;

     -- t16_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1213_c7_3340_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- n16_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_6e69] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output := result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_6e69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- n16_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1206_c7_b609] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output := result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1206_c7_b609_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- n16_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1203_c7_3d7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_3d7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c7_a554] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1198_c7_a554_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_97c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_97c3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c2_d1ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1186_l1242_DUPLICATE_0151 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1186_l1242_DUPLICATE_0151_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c2_d1ce_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1186_l1242_DUPLICATE_0151_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1186_l1242_DUPLICATE_0151_return_output;
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
