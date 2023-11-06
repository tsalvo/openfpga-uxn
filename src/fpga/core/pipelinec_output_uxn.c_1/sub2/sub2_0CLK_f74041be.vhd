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
-- Submodules: 79
entity sub2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_f74041be;
architecture arch of sub2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2368_c6_33d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2368_c1_2eac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2368_c2_653a]
signal n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c2_653a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2368_c2_653a]
signal t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2368_c2_653a]
signal tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2369_c3_e152[uxn_opcodes_h_l2369_c3_e152]
signal printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_0c73]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2373_c7_e453]
signal n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_e453]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2373_c7_e453]
signal t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2373_c7_e453]
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_e45d]
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2376_c7_987d]
signal n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_987d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2376_c7_987d]
signal t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2376_c7_987d]
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_0113]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2381_c7_a1fc]
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2382_c3_d913]
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_267e]
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2385_c7_a275]
signal n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2385_c7_a275]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2385_c7_a275]
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_ad82]
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2389_c7_b0cd]
signal tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2390_c3_2f11]
signal BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2391_c11_11d4]
signal BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2393_c30_ac63]
signal sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_76ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2398_c7_69fc]
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2398_c7_69fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2398_c7_69fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2398_c7_69fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2398_c7_69fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2401_c31_a8d3]
signal CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_8ed3]
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_7cea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_7cea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6
BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output);

-- n16_MUX_uxn_opcodes_h_l2368_c2_653a
n16_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a
result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- t16_MUX_uxn_opcodes_h_l2368_c2_653a
t16_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2368_c2_653a
tmp16_MUX_uxn_opcodes_h_l2368_c2_653a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond,
tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

-- printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152
printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152 : entity work.printf_uxn_opcodes_h_l2369_c3_e152_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output);

-- n16_MUX_uxn_opcodes_h_l2373_c7_e453
n16_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- t16_MUX_uxn_opcodes_h_l2373_c7_e453
t16_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2373_c7_e453
tmp16_MUX_uxn_opcodes_h_l2373_c7_e453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond,
tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue,
tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse,
tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output);

-- n16_MUX_uxn_opcodes_h_l2376_c7_987d
n16_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- t16_MUX_uxn_opcodes_h_l2376_c7_987d
t16_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2376_c7_987d
tmp16_MUX_uxn_opcodes_h_l2376_c7_987d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond,
tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output);

-- n16_MUX_uxn_opcodes_h_l2381_c7_a1fc
n16_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- t16_MUX_uxn_opcodes_h_l2381_c7_a1fc
t16_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc
tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond,
tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913
BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left,
BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right,
BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output);

-- n16_MUX_uxn_opcodes_h_l2385_c7_a275
n16_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275
result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2385_c7_a275
tmp16_MUX_uxn_opcodes_h_l2385_c7_a275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond,
tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue,
tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse,
tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output);

-- n16_MUX_uxn_opcodes_h_l2389_c7_b0cd
n16_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd
tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond,
tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11
BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left,
BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right,
BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4
BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left,
BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right,
BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63
sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins,
sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x,
sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y,
sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3
CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x,
CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca
CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output,
 n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output,
 n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output,
 n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output,
 n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output,
 n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output,
 n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output,
 sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output,
 CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_9400 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_de79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_2f94 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_89f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_caa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2396_c21_4fb0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_369e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2401_c21_447b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2398_l2385_DUPLICATE_cc7d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2408_l2364_DUPLICATE_71e9_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_caa2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_caa2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_9400 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_9400;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_2f94 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_2f94;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_de79 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_de79;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_369e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_369e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_89f5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_89f5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2368_c6_33d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_8ed3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_0c73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_e45d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_76ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2393_c30_ac63] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_ins;
     sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_x;
     sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output := sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2401_c31_a8d3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output := CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_0113] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2398_l2385_DUPLICATE_cc7d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2398_l2385_DUPLICATE_cc7d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_267e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_ad82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c6_33d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_0c73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_e45d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_0113_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_267e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_ad82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_76ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_8ed3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2382_l2386_l2390_DUPLICATE_2c75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2368_DUPLICATE_047b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2389_l2385_l2381_l2376_l2373_l2403_l2398_DUPLICATE_625f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_c5ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2403_l2368_l2398_DUPLICATE_17e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2398_l2385_DUPLICATE_cc7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2398_l2385_DUPLICATE_cc7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2385_l2381_l2376_l2373_l2368_l2398_DUPLICATE_11de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2393_c30_ac63_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2390_c3_2f11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_left;
     BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output := BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2398_c7_69fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2368_c1_2eac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_7cea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2398_c7_69fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2401_c21_447b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2401_c21_447b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2401_c31_a8d3_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_7cea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2382_c3_d913] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_left;
     BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output := BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_d913_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2390_c3_2f11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2401_c21_447b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2387_l2378_DUPLICATE_60ca_return_output;
     VAR_printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2368_c1_2eac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_7cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2398_c7_69fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- n16_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2398_c7_69fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2398_c7_69fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2391_c11_11d4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output;

     -- printf_uxn_opcodes_h_l2369_c3_e152[uxn_opcodes_h_l2369_c3_e152] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2369_c3_e152_uxn_opcodes_h_l2369_c3_e152_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_69fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2396_c21_4fb0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2396_c21_4fb0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2391_c11_11d4_return_output);

     -- t16_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- n16_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2396_c21_4fb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- n16_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_b0cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_b0cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2385_c7_a275] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output := result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2385_c7_a275_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_a1fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_a1fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2376_c7_987d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- n16_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_987d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2373_c7_e453] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output := result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_e453_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2368_c2_653a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2408_l2364_DUPLICATE_71e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2408_l2364_DUPLICATE_71e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c2_653a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c2_653a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2408_l2364_DUPLICATE_71e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2408_l2364_DUPLICATE_71e9_return_output;
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
