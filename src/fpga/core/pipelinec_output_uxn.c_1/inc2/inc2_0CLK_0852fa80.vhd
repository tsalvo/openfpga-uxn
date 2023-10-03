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
-- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_1c81]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_1e46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_0f24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1016_c3_5897[uxn_opcodes_h_l1016_c3_5897]
signal printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_9e8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_11ea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_36a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_b8c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1029_c3_ee22]
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_8428]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_a30c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_deea]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_68d8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1038_c3_40a6]
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_d515]
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1042_c32_13da]
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1042_c32_95e1]
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1042_c32_a705]
signal MUX_uxn_opcodes_h_l1042_c32_a705_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a705_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a705_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_a705_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_8e33]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_1474]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_1474]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_1474]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_1474]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_1474]
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0974]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_f091]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_f091]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_f091]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_f091]
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1053_c34_4ee4]
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_baec]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_95c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_95c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24
tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- t16_MUX_uxn_opcodes_h_l1015_c2_0f24
t16_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

-- printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897
printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897 : entity work.printf_uxn_opcodes_h_l1016_c3_5897_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea
tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- t16_MUX_uxn_opcodes_h_l1023_c7_11ea
t16_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9
tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1027_c7_b8c9
t16_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22
CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x,
CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c
tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- t16_MUX_uxn_opcodes_h_l1033_c7_a30c
t16_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8
tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- t16_MUX_uxn_opcodes_h_l1037_c7_68d8
t16_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6
BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da
BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1
BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output);

-- MUX_uxn_opcodes_h_l1042_c32_a705
MUX_uxn_opcodes_h_l1042_c32_a705 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1042_c32_a705_cond,
MUX_uxn_opcodes_h_l1042_c32_a705_iftrue,
MUX_uxn_opcodes_h_l1042_c32_a705_iffalse,
MUX_uxn_opcodes_h_l1042_c32_a705_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4
CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x,
CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output,
 tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output,
 CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output,
 tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output,
 tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output,
 MUX_uxn_opcodes_h_l1042_c32_a705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output,
 CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_24cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_9e42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_5b8b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_f8ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1039_c3_b813 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a705_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_a705_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_a632 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_c1e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7fe1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_a414_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_4339_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_2d0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1060_l1011_DUPLICATE_c576_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_f8ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_f8ca;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_5b8b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_5b8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7fe1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7fe1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_24cf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_24cf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_9e42 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_9e42;
     VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_a632 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_a632;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1053_c34_4ee4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output := CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output := result.sp_relative_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_68d8_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1048_c24_c1e1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_c1e1_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_baec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_0f24_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_deea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_1c81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_2d0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_2d0b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_9e8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_8428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_8e33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_36a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1042_c32_13da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_left;
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output := BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0974] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_4339 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_4339_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_13da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_1c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9e8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_36a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_8428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_deea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8e33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_baec_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_4339_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_4339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_c1e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_1f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_61d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_2820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_fc5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_2d0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_2d0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_842c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_0f24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_68d8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_f091] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1042_c32_95e1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_left;
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output := BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_95c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_1474] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_1e46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1029_c3_ee22] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output := CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_95c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1053_c24_a414] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_a414_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_4ee4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1038_c3_40a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_left;
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output := BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1042_c32_a705_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_95e1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_40a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_a414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_ee22_return_output;
     VAR_printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_1e46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_95c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_f091] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_1474] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;

     -- t16_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_f091] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output := result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_f091] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- printf_uxn_opcodes_h_l1016_c3_5897[uxn_opcodes_h_l1016_c3_5897] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1016_c3_5897_uxn_opcodes_h_l1016_c3_5897_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_d515] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output;

     -- MUX[uxn_opcodes_h_l1042_c32_a705] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1042_c32_a705_cond <= VAR_MUX_uxn_opcodes_h_l1042_c32_a705_cond;
     MUX_uxn_opcodes_h_l1042_c32_a705_iftrue <= VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iftrue;
     MUX_uxn_opcodes_h_l1042_c32_a705_iffalse <= VAR_MUX_uxn_opcodes_h_l1042_c32_a705_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1042_c32_a705_return_output := MUX_uxn_opcodes_h_l1042_c32_a705_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1039_c3_b813 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_d515_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_MUX_uxn_opcodes_h_l1042_c32_a705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_f091_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue := VAR_tmp16_uxn_opcodes_h_l1039_c3_b813;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_1474] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;

     -- t16_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_1474] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output := result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_1474] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_1474_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_68d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_68d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_a30c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_a30c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_b8c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_b8c9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_11ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_11ea_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_0f24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output := result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1060_l1011_DUPLICATE_c576 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1060_l1011_DUPLICATE_c576_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_0f24_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1060_l1011_DUPLICATE_c576_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1060_l1011_DUPLICATE_c576_return_output;
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
