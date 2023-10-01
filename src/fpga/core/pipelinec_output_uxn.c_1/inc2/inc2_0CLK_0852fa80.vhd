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
-- Submodules: 78
entity inc2_0CLK_0852fa80 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_0852fa80;
architecture arch of inc2_0CLK_0852fa80 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_acb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_d257]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_cedb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1016_c3_6339[uxn_opcodes_h_l1016_c3_6339]
signal printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_7a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1023_c7_1326]
signal t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_1326]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_1326]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_9cbf]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1027_c7_d670]
signal t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1027_c7_d670]
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_d670]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1029_c3_7837]
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_77e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1033_c7_1382]
signal t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1033_c7_1382]
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_1382]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_f849]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1037_c7_b517]
signal t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1037_c7_b517]
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_b517]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1038_c3_eb68]
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_81db]
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1042_c32_ddad]
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1042_c32_517e]
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1042_c32_a57a]
signal MUX_uxn_opcodes_h_l1042_c32_a57a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a57a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_c73a]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_5f86]
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_5f86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_5f86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_5f86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_5f86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_adf7]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_c05c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_c05c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_c05c]
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_c05c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1053_c34_c914]
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_5ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_c0c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_c0c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output);

-- t16_MUX_uxn_opcodes_h_l1015_c2_cedb
t16_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb
tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

-- printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339
printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339 : entity work.printf_uxn_opcodes_h_l1016_c3_6339_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output);

-- t16_MUX_uxn_opcodes_h_l1023_c7_1326
t16_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_1326
tmp16_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output);

-- t16_MUX_uxn_opcodes_h_l1027_c7_d670
t16_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1027_c7_d670
tmp16_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1029_c3_7837
CONST_SL_8_uxn_opcodes_h_l1029_c3_7837 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x,
CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1033_c7_1382
t16_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1033_c7_1382
tmp16_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output);

-- t16_MUX_uxn_opcodes_h_l1037_c7_b517
t16_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1037_c7_b517
tmp16_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68
BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad
BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e
BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output);

-- MUX_uxn_opcodes_h_l1042_c32_a57a
MUX_uxn_opcodes_h_l1042_c32_a57a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1042_c32_a57a_cond,
MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue,
MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse,
MUX_uxn_opcodes_h_l1042_c32_a57a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1053_c34_c914
CONST_SR_8_uxn_opcodes_h_l1053_c34_c914 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x,
CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output,
 t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output,
 t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output,
 t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output,
 CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output,
 t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output,
 t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output,
 MUX_uxn_opcodes_h_l1042_c32_a57a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_9680 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_682b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_c873 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_81ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1039_c3_6ed0 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_b517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_2e1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_a7a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_ab2d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_7cce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1028_l1038_DUPLICATE_f0c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_86ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1011_l1060_DUPLICATE_aff2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_682b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_682b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_c873 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_c873;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_2e1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_2e1b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_ab2d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_ab2d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_81ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_81ce;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_9680 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_9680;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_5ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_acb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_9cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_adf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_77e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1042_c32_ddad] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_left;
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output := BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_cedb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_7a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_f849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1053_c34_c914] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output := CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output := result.stack_value;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_b517_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_c73a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1028_l1038_DUPLICATE_f0c7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1028_l1038_DUPLICATE_f0c7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_86ab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_86ab_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1048_c24_a7a9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_a7a9_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_ddad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_acb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_7a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9cbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_77e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_c73a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_adf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ebb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1028_l1038_DUPLICATE_f0c7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1028_l1038_DUPLICATE_f0c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_a7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1033_l1015_DUPLICATE_9fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1044_l1027_l1037_l1023_l1050_l1055_l1033_DUPLICATE_da1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1044_l1027_l1023_l1033_l1015_DUPLICATE_6e38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1055_l1033_DUPLICATE_dbf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_86ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_86ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1027_l1037_l1023_l1050_l1033_l1015_DUPLICATE_cf44_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_cedb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_b517_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_5f86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_c0c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_c05c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1042_c32_517e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_left;
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output := BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_c0c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1053_c24_7cce] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_7cce_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_c914_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1029_c3_7837] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output := CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_d257] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1038_c3_eb68] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_left;
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output := BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_517e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_eb68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_7cce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_7837_return_output;
     VAR_printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c0c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_c05c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;

     -- printf_uxn_opcodes_h_l1016_c3_6339[uxn_opcodes_h_l1016_c3_6339] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1016_c3_6339_uxn_opcodes_h_l1016_c3_6339_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_c05c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_5f86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;

     -- t16_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_81db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output;

     -- MUX[uxn_opcodes_h_l1042_c32_a57a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1042_c32_a57a_cond <= VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_cond;
     MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue <= VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iftrue;
     MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse <= VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_return_output := MUX_uxn_opcodes_h_l1042_c32_a57a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_c05c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1039_c3_6ed0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_81db_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_MUX_uxn_opcodes_h_l1042_c32_a57a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_c05c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue := VAR_tmp16_uxn_opcodes_h_l1039_c3_6ed0;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_5f86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_5f86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- t16_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_5f86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output := result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_5f86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- t16_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_b517] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b517_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- t16_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_1382] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_1382_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     -- t16_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_d670] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_d670_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_1326] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_1326_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_cedb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1011_l1060_DUPLICATE_aff2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1011_l1060_DUPLICATE_aff2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_cedb_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1011_l1060_DUPLICATE_aff2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1011_l1060_DUPLICATE_aff2_return_output;
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
