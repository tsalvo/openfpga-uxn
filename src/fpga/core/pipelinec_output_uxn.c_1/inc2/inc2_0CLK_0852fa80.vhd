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
-- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_91eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_9bfe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1015_c2_080c]
signal t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_080c]
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1015_c2_080c]
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1016_c3_c3c9[uxn_opcodes_h_l1016_c3_c3c9]
signal printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_d17c]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1023_c7_160c]
signal t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_160c]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_160c]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_ed80]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1027_c7_f839]
signal t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_f839]
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1027_c7_f839]
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1029_c3_1fcc]
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_47d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1033_c7_c1d1]
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_cadc]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1037_c7_4c12]
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1038_c3_6d98]
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_fec8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1042_c32_d188]
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1042_c32_7839]
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1042_c32_33f9]
signal MUX_uxn_opcodes_h_l1042_c32_33f9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1042_c32_33f9_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_6aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_02e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_02e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_02e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_02e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_02e7]
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_75e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_3c55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_3c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_3c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_3c55]
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1053_c34_a8f4]
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_0945]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_5f99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_5f99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output);

-- t16_MUX_uxn_opcodes_h_l1015_c2_080c
t16_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1015_c2_080c
tmp16_MUX_uxn_opcodes_h_l1015_c2_080c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond,
tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

-- printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9
printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9 : entity work.printf_uxn_opcodes_h_l1016_c3_c3c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output);

-- t16_MUX_uxn_opcodes_h_l1023_c7_160c
t16_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_160c
tmp16_MUX_uxn_opcodes_h_l1023_c7_160c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output);

-- t16_MUX_uxn_opcodes_h_l1027_c7_f839
t16_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1027_c7_f839
tmp16_MUX_uxn_opcodes_h_l1027_c7_f839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond,
tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue,
tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse,
tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc
CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x,
CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output);

-- t16_MUX_uxn_opcodes_h_l1033_c7_c1d1
t16_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1
tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond,
tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output);

-- t16_MUX_uxn_opcodes_h_l1037_c7_4c12
t16_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12
tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond,
tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue,
tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse,
tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98
BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right,
BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188
BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right,
BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839
BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right,
BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output);

-- MUX_uxn_opcodes_h_l1042_c32_33f9
MUX_uxn_opcodes_h_l1042_c32_33f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1042_c32_33f9_cond,
MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue,
MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse,
MUX_uxn_opcodes_h_l1042_c32_33f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4
CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x,
CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output,
 t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output,
 t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output,
 t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output,
 CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output,
 t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output,
 t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output,
 MUX_uxn_opcodes_h_l1042_c32_33f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output,
 CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_582d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_046a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_587d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_e0f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1039_c3_55f1 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_71c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_cc8c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_58ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_4fec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_e806_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_246d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1060_l1011_DUPLICATE_dd81_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_046a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_046a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_e0f8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_e0f8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_582d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_582d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_587d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_587d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_58ca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_58ca;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_71c3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1047_c3_71c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_0945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_47d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_4c12_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_cadc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_6aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_e806 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_e806_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_080c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_ed80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_75e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c6_91eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1053_c34_a8f4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output := CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_246d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_246d_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1048_c24_cc8c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_cc8c_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1042_c32_d188] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_left;
     BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output := BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_d17c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1042_c32_d188_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c6_91eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_d17c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_ed80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_47d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_cadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_6aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_75e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_0945_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_e806_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1038_l1028_DUPLICATE_e806_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1048_c24_cc8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1023_l1015_l1037_l1033_l1027_DUPLICATE_f1d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1055_l1050_l1044_l1037_l1033_l1027_DUPLICATE_4b06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1023_l1015_l1044_l1033_l1027_DUPLICATE_73bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1023_l1055_l1037_l1033_l1027_DUPLICATE_1f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_246d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1037_DUPLICATE_246d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1023_l1015_l1050_l1037_l1033_l1027_DUPLICATE_ce3a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1015_c2_080c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_c7_4c12_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_5f99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1038_c3_6d98] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_left;
     BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output := BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_9bfe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_3c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_5f99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1042_c32_7839] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_left;
     BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output := BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1053_c24_4fec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_4fec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1053_c34_a8f4_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1044_c7_02e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1029_c3_1fcc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output := CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1042_c32_7839_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1038_c3_6d98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1053_c24_4fec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1029_c3_1fcc_return_output;
     VAR_printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_9bfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_5f99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1039_c11_fec8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1044_c7_02e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_3c55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;

     -- printf_uxn_opcodes_h_l1016_c3_c3c9[uxn_opcodes_h_l1016_c3_c3c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1016_c3_c3c9_uxn_opcodes_h_l1016_c3_c3c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1050_c7_3c55] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output := result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_3c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;

     -- MUX[uxn_opcodes_h_l1042_c32_33f9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1042_c32_33f9_cond <= VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_cond;
     MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue <= VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iftrue;
     MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse <= VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_return_output := MUX_uxn_opcodes_h_l1042_c32_33f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1039_c3_55f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1039_c11_fec8_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_MUX_uxn_opcodes_h_l1042_c32_33f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1050_c7_3c55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue := VAR_tmp16_uxn_opcodes_h_l1039_c3_55f1;
     -- tmp16_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1044_c7_02e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- t16_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1044_c7_02e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1044_c7_02e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1044_c7_02e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     -- t16_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_4c12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4c12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_c1d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1033_c7_c1d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1027_c7_f839] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output := result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1027_c7_f839_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_160c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_160c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c2_080c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1060_l1011_DUPLICATE_dd81 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1060_l1011_DUPLICATE_dd81_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c2_080c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c2_080c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1060_l1011_DUPLICATE_dd81_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1060_l1011_DUPLICATE_dd81_return_output;
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
