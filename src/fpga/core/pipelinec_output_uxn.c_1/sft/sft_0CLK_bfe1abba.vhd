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
-- Submodules: 43
entity sft_0CLK_bfe1abba is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_bfe1abba;
architecture arch of sft_0CLK_bfe1abba is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1997_c6_d703]
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1997_c2_6e64]
signal n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2005_c11_f986]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2005_c7_2e81]
signal n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2008_c30_b6f5]
signal sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_eac6]
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2010_c7_0192]
signal tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2010_c7_0192]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2010_c7_0192]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2010_c7_0192]
signal result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2010_c7_0192]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2010_c7_0192]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2010_c7_0192]
signal t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2010_c7_0192]
signal n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2012_c18_2ec0]
signal CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2014_c18_a3a7]
signal BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2014_c11_47ad]
signal BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2014_c34_526d]
signal CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2014_c11_41ac]
signal BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_5250]
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2019_c7_4bdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2019_c7_4bdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_operation_16bit := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703
BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left,
BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right,
BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64
tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64
result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- t8_MUX_uxn_opcodes_h_l1997_c2_6e64
t8_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- n8_MUX_uxn_opcodes_h_l1997_c2_6e64
n8_MUX_uxn_opcodes_h_l1997_c2_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond,
n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue,
n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse,
n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81
tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81
result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- t8_MUX_uxn_opcodes_h_l2005_c7_2e81
t8_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- n8_MUX_uxn_opcodes_h_l2005_c7_2e81
n8_MUX_uxn_opcodes_h_l2005_c7_2e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond,
n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue,
n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse,
n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5
sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins,
sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x,
sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y,
sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2010_c7_0192
tmp8_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192
result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192
result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- t8_MUX_uxn_opcodes_h_l2010_c7_0192
t8_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- n8_MUX_uxn_opcodes_h_l2010_c7_0192
n8_MUX_uxn_opcodes_h_l2010_c7_0192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond,
n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue,
n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse,
n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0
CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x,
CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7
BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left,
BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right,
BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad
BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left,
BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right,
BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2014_c34_526d
CONST_SR_4_uxn_opcodes_h_l2014_c34_526d : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x,
CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac
BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left,
BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right,
BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output,
 tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output,
 tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output,
 sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output,
 tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output,
 CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output,
 CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_297a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2005_c7_2e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_603a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2011_c8_8794_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2012_c8_3045_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2010_l1997_DUPLICATE_4eb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2005_DUPLICATE_dddd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2010_l2005_DUPLICATE_0326_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2024_l1993_DUPLICATE_ad11_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_603a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_603a;
     VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right := to_unsigned(15, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_297a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_297a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := tmp8;
     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2005_c7_2e81_return_output := result.is_stack_operation_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c11_f986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2008_c30_b6f5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_ins;
     sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_x;
     sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output := sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_5250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2005_DUPLICATE_dddd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2005_DUPLICATE_dddd_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2011_c8_8794] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2011_c8_8794_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2010_l2005_DUPLICATE_0326 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2010_l2005_DUPLICATE_0326_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1997_c6_d703] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_left;
     BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output := BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2012_c18_2ec0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output := CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_eac6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2010_l1997_DUPLICATE_4eb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2010_l1997_DUPLICATE_4eb4_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c6_d703_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_f986_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_eac6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_5250_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2011_c8_8794_return_output;
     VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2011_c8_8794_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2011_c8_8794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2005_DUPLICATE_dddd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2005_DUPLICATE_dddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2019_l2005_DUPLICATE_f0b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2010_l1997_DUPLICATE_4eb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2010_l1997_DUPLICATE_4eb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2019_l2005_DUPLICATE_672c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2010_l2005_DUPLICATE_0326_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2010_l2005_DUPLICATE_0326_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2010_l1997_l2005_DUPLICATE_9111_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2008_c30_b6f5_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l2014_c18_a3a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_left;
     BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output := BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2019_c7_4bdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2019_c7_4bdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2014_c34_526d] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output := CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2012_c8_3045] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2012_c8_3045_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2012_c18_2ec0_return_output);

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c18_a3a7_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2012_c8_3045_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2012_c8_3045_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right := VAR_CONST_SR_4_uxn_opcodes_h_l2014_c34_526d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_4bdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- n8_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2014_c11_47ad] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_left;
     BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output := BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- t8_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2014_c11_47ad_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- n8_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2014_c11_41ac] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_left;
     BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output := BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- t8_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2014_c11_41ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- n8_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2010_c7_0192] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_cond;
     tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output := tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2010_c7_0192_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2005_c7_2e81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output := result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2005_c7_2e81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1997_c2_6e64] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_cond;
     tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output := tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2024_l1993_DUPLICATE_ad11 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2024_l1993_DUPLICATE_ad11_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c2_6e64_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2024_l1993_DUPLICATE_ad11_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2024_l1993_DUPLICATE_ad11_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
