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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_c082]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_dac3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1641_c2_ac6f]
signal t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1642_c3_8988[uxn_opcodes_h_l1642_c3_8988]
signal printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_97b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1647_c7_fbe6]
signal t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_49c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1650_c7_7df1]
signal t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1652_c3_c06a]
signal CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_c652]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1655_c7_7a09]
signal t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_0531]
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_471b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1658_c7_471b]
signal t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1659_c3_d02f]
signal BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_aa02]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1662_c7_15c8]
signal result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1664_c32_6d7f]
signal BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1664_c32_3d08]
signal BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1664_c32_7d12]
signal MUX_uxn_opcodes_h_l1664_c32_7d12_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1664_c32_7d12_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_9985]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1666_c7_5363]
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_a1d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_ace7]
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_1713]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_8976]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_8976]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1676_c7_8976]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_8976]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1676_c7_8976]
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1678_c34_efa5]
signal CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_773b]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_1036]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_1036]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1680_c7_1036]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1641_c2_ac6f
t16_MUX_uxn_opcodes_h_l1641_c2_ac6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond,
t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue,
t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse,
t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

-- printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988
printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988 : entity work.printf_uxn_opcodes_h_l1642_c3_8988_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- t16_MUX_uxn_opcodes_h_l1647_c7_fbe6
t16_MUX_uxn_opcodes_h_l1647_c7_fbe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond,
t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue,
t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse,
t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1
result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- t16_MUX_uxn_opcodes_h_l1650_c7_7df1
t16_MUX_uxn_opcodes_h_l1650_c7_7df1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond,
t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue,
t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse,
t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a
CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x,
CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09
result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09
result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- t16_MUX_uxn_opcodes_h_l1655_c7_7a09
t16_MUX_uxn_opcodes_h_l1655_c7_7a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond,
t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue,
t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse,
t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b
result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b
result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b
result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- t16_MUX_uxn_opcodes_h_l1658_c7_471b
t16_MUX_uxn_opcodes_h_l1658_c7_471b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond,
t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue,
t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse,
t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f
BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left,
BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right,
BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8
result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f
BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left,
BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right,
BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08
BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left,
BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right,
BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output);

-- MUX_uxn_opcodes_h_l1664_c32_7d12
MUX_uxn_opcodes_h_l1664_c32_7d12 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1664_c32_7d12_cond,
MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue,
MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse,
MUX_uxn_opcodes_h_l1664_c32_7d12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5
CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x,
CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output,
 CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output,
 MUX_uxn_opcodes_h_l1664_c32_7d12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output,
 CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_e01f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_b9b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_2c47 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4a92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1668_c3_2b96 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_f1ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1674_c24_4e2a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_2102 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c24_4bd1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1651_l1659_DUPLICATE_7371_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2_uxn_opcodes_h_l1686_l1637_DUPLICATE_8bad_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_b9b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_b9b2;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_e01f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_e01f;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4a92 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4a92;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1668_c3_2b96 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1668_c3_2b96;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_2102 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_2102;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_f1ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_f1ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_2c47 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_2c47;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse := resize(to_signed(-2, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_c652] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1664_c32_6d7f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_left;
     BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output := BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_9985] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_1713] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1651_l1659_DUPLICATE_7371 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1651_l1659_DUPLICATE_7371_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l1678_c34_efa5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output := CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_97b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_773b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_a1d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_0531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_left;
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output := BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_c082] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1674_c24_4e2a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1674_c24_4e2a_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_49c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_aa02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1664_c32_6d7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_c082_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_97b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_49c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c652_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aa02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_9985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_a1d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_1713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_773b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1651_l1659_DUPLICATE_7371_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1651_l1659_DUPLICATE_7371_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1674_c24_4e2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_DUPLICATE_b68b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1680_l1670_DUPLICATE_456e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1666_l1655_l1658_l1650_l1647_l1641_l1670_DUPLICATE_93aa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1676_l1662_l1655_l1658_l1650_l1647_l1641_l1680_l1670_DUPLICATE_10d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1650_l1655_l1647_l1658_DUPLICATE_c195_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_l1680_DUPLICATE_6efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1662_l1676_l1666_l1658_DUPLICATE_8349_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1676_l1666_l1662_l1655_l1658_l1650_l1647_l1641_DUPLICATE_979f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_dac3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1664_c32_3d08] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_left;
     BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output := BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1680_c7_1036] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_1036] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_1036] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1659_c3_d02f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_left;
     BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output := BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1678_c24_4bd1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c24_4bd1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1678_c34_efa5_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_8976] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1652_c3_c06a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output := CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1664_c32_3d08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1659_c3_d02f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c24_4bd1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1652_c3_c06a_return_output;
     VAR_printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_dac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_1036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_8976] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_8976] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1676_c7_8976] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1676_c7_8976] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output := result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- printf_uxn_opcodes_h_l1642_c3_8988[uxn_opcodes_h_l1642_c3_8988] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1642_c3_8988_uxn_opcodes_h_l1642_c3_8988_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1664_c32_7d12] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1664_c32_7d12_cond <= VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_cond;
     MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue <= VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iftrue;
     MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse <= VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_return_output := MUX_uxn_opcodes_h_l1664_c32_7d12_return_output;

     -- t16_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue := VAR_MUX_uxn_opcodes_h_l1664_c32_7d12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_8976_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_ace7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_ace7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_5363] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_5363_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- t16_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_15c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1662_c7_15c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1658_c7_471b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1658_c7_471b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c7_7a09] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1655_c7_7a09_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1650_c7_7df1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_7df1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1647_c7_fbe6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1647_c7_fbe6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_ac6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2_uxn_opcodes_h_l1686_l1637_DUPLICATE_8bad LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2_uxn_opcodes_h_l1686_l1637_DUPLICATE_8bad_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_ac6f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2_uxn_opcodes_h_l1686_l1637_DUPLICATE_8bad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f4f2_uxn_opcodes_h_l1686_l1637_DUPLICATE_8bad_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
