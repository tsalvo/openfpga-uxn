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
entity and2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_b14a5a36;
architecture arch of and2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l718_c6_4e02]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_ad3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l718_c2_c84c]
signal n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l718_c2_c84c]
signal t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l718_c2_c84c]
signal tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_c84c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l719_c3_d410[uxn_opcodes_h_l719_c3_d410]
signal printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_8df4]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l726_c7_2b73]
signal n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_2b73]
signal t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l726_c7_2b73]
signal tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_2b73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l730_c11_1100]
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_dbfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_a4d1]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l736_c7_c354]
signal n16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_c354]
signal t16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l736_c7_c354]
signal tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_c354]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_c8ce]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l740_c7_4904]
signal n16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l740_c7_4904]
signal t16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l740_c7_4904]
signal tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_4904]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l741_c3_93aa]
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l745_c11_4977]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l745_c7_6a08]
signal n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l745_c7_6a08]
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_6a08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_bbdc]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l749_c7_201d]
signal n16_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l749_c7_201d]
signal tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_201d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c11_46b2]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l755_c7_773f]
signal n16_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l755_c7_773f]
signal tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_773f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l759_c11_0e45]
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l759_c7_ec94]
signal n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l759_c7_ec94]
signal tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_ec94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l760_c3_eef5]
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l761_c11_ee5b]
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l764_c32_3c70]
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l764_c32_2724]
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l764_c32_48ad]
signal MUX_uxn_opcodes_h_l764_c32_48ad_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_48ad_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_48ad_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_48ad_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l766_c11_f2f2]
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l766_c7_97ad]
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_97ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_97ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_97ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_97ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_0484]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_b3a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_b3a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l772_c7_b3a6]
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_b3a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l775_c34_97e1]
signal CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_9003]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_48f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_48f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02
BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output);

-- n16_MUX_uxn_opcodes_h_l718_c2_c84c
n16_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- t16_MUX_uxn_opcodes_h_l718_c2_c84c
t16_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l718_c2_c84c
tmp16_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c
result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

-- printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410
printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410 : entity work.printf_uxn_opcodes_h_l719_c3_d410_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4
BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output);

-- n16_MUX_uxn_opcodes_h_l726_c7_2b73
n16_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_2b73
t16_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l726_c7_2b73
tmp16_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73
result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100
BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output);

-- n16_MUX_uxn_opcodes_h_l730_c7_dbfa
n16_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- t16_MUX_uxn_opcodes_h_l730_c7_dbfa
t16_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa
tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa
result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1
BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output);

-- n16_MUX_uxn_opcodes_h_l736_c7_c354
n16_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l736_c7_c354_cond,
n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_c354
t16_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_c354_cond,
t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- tmp16_MUX_uxn_opcodes_h_l736_c7_c354
tmp16_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond,
tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354
result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce
BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output);

-- n16_MUX_uxn_opcodes_h_l740_c7_4904
n16_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l740_c7_4904_cond,
n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- t16_MUX_uxn_opcodes_h_l740_c7_4904
t16_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l740_c7_4904_cond,
t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- tmp16_MUX_uxn_opcodes_h_l740_c7_4904
tmp16_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond,
tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904
result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa
BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left,
BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right,
BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977
BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output);

-- n16_MUX_uxn_opcodes_h_l745_c7_6a08
n16_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l745_c7_6a08
tmp16_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc
BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output);

-- n16_MUX_uxn_opcodes_h_l749_c7_201d
n16_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l749_c7_201d_cond,
n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l749_c7_201d
tmp16_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond,
tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d
result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2
BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output);

-- n16_MUX_uxn_opcodes_h_l755_c7_773f
n16_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l755_c7_773f_cond,
n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l755_c7_773f
tmp16_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond,
tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f
result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45
BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output);

-- n16_MUX_uxn_opcodes_h_l759_c7_ec94
n16_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- tmp16_MUX_uxn_opcodes_h_l759_c7_ec94
tmp16_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94
result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5
BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left,
BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right,
BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b
BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left,
BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right,
BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70
BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left,
BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right,
BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l764_c32_2724
BIN_OP_GT_uxn_opcodes_h_l764_c32_2724 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left,
BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right,
BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output);

-- MUX_uxn_opcodes_h_l764_c32_48ad
MUX_uxn_opcodes_h_l764_c32_48ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l764_c32_48ad_cond,
MUX_uxn_opcodes_h_l764_c32_48ad_iftrue,
MUX_uxn_opcodes_h_l764_c32_48ad_iffalse,
MUX_uxn_opcodes_h_l764_c32_48ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2
BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad
result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484
BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6
result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l775_c34_97e1
CONST_SR_8_uxn_opcodes_h_l775_c34_97e1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x,
CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003
BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output,
 n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output,
 n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output,
 n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output,
 n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output,
 n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output,
 BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output,
 n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output,
 n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output,
 n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output,
 n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output,
 BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output,
 BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output,
 MUX_uxn_opcodes_h_l764_c32_48ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output,
 CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_4678 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_b167 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d151 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_92ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b1fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6bab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_3fe5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_d86f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_ec94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_48ad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_48ad_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_1603 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_b290_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_8472 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_81b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l759_DUPLICATE_cc8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l782_l714_DUPLICATE_3646_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_b167 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_b167;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b1fc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b1fc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_8472 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_8472;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d151 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d151;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6bab := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6bab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_1603 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_1603;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_4678 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_4678;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_d86f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_d86f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_3fe5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_3fe5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_92ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_92ad;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l745_c11_4977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l764_c32_3c70] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_left;
     BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output := BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_0484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_a4d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_bbdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_ec94_return_output := result.is_stack_read;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_c84c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_9003] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l770_c24_b290] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_b290_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l775_c34_97e1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output := CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l766_c11_f2f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_8df4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_c8ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c6_4e02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l759_DUPLICATE_cc8e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l759_DUPLICATE_cc8e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l730_c11_1100] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_left;
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output := BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c11_46b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l759_c11_0e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left := VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_3c70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_4e02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_8df4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_1100_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_a4d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_c8ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_4977_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_bbdc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_46b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_0e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_f2f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_0484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_9003_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l731_l760_l741_l750_DUPLICATE_2abf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_b290_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l736_DUPLICATE_27a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l772_l736_l766_DUPLICATE_ec68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l730_l726_l755_l718_l749_l745_l740_l736_l766_DUPLICATE_8585_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l730_l759_l726_l755_l749_l745_l777_l740_l736_DUPLICATE_20cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l759_DUPLICATE_cc8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l759_DUPLICATE_cc8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l730_l759_l726_l755_l718_l749_l745_l740_l772_l736_DUPLICATE_75b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_c84c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_ec94_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_ad3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_48f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_48f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c24_81b7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_81b7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_97e1_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_97ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l741_c3_93aa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_left;
     BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output := BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l764_c32_2724] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_left;
     BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output := BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l760_c3_eef5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_left;
     BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output := BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_b3a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l764_c32_48ad_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_2724_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_93aa_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_eef5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_81b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_f02a_return_output;
     VAR_printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_ad3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_48f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_48f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_b3a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;

     -- printf_uxn_opcodes_h_l719_c3_d410[uxn_opcodes_h_l719_c3_d410] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l719_c3_d410_uxn_opcodes_h_l719_c3_d410_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_97ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l772_c7_b3a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output := t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- MUX[uxn_opcodes_h_l764_c32_48ad] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l764_c32_48ad_cond <= VAR_MUX_uxn_opcodes_h_l764_c32_48ad_cond;
     MUX_uxn_opcodes_h_l764_c32_48ad_iftrue <= VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iftrue;
     MUX_uxn_opcodes_h_l764_c32_48ad_iffalse <= VAR_MUX_uxn_opcodes_h_l764_c32_48ad_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l764_c32_48ad_return_output := MUX_uxn_opcodes_h_l764_c32_48ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l761_c11_ee5b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_left;
     BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output := BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_b3a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_ee5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue := VAR_MUX_uxn_opcodes_h_l764_c32_48ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_b3a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_t16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     -- t16_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output := t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_97ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_97ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l766_c7_97ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- n16_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output := n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_97ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output := tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- n16_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output := n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- t16_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_ec94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_ec94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     -- t16_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output := tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- n16_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_773f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_n16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_773f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- t16_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- n16_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output := n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_201d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_n16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_201d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output := tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- n16_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output := n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_6a08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6a08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output := tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- n16_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_4904] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_n16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_4904_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- n16_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_c354] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_c354_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- n16_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l730_c7_dbfa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output := result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_dbfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l726_c7_2b73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output := result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_2b73_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_c84c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l782_l714_DUPLICATE_3646 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l782_l714_DUPLICATE_3646_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_c84c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_c84c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l782_l714_DUPLICATE_3646_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l782_l714_DUPLICATE_3646_return_output;
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
