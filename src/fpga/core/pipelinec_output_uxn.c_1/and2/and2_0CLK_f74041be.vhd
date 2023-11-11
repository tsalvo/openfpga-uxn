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
entity and2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_f74041be;
architecture arch of and2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l909_c6_e9a1]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_d5ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c2_072f]
signal tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c2_072f]
signal n16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c2_072f]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c2_072f]
signal t16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l910_c3_b748[uxn_opcodes_h_l910_c3_b748]
signal printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_f545]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l914_c7_c795]
signal tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l914_c7_c795]
signal n16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l914_c7_c795]
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l914_c7_c795]
signal t16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_e48f]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l917_c7_403b]
signal tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l917_c7_403b]
signal n16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_403b]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l917_c7_403b]
signal t16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_54be]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_edf0]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_edf0]
signal n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l922_c7_edf0]
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l922_c7_edf0]
signal t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l923_c3_06df]
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_8ef1]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_6c09]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_6c09]
signal n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l926_c7_6c09]
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_20f7]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c7_64c2]
signal tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c7_64c2]
signal n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_64c2]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l931_c3_9a51]
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l932_c11_3305]
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l934_c30_9c49]
signal sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_32be]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_e421]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_e421]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_e421]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_e421]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c7_e421]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l942_c31_537a]
signal CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_425d]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_a33c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_a33c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c2_072f
tmp16_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond,
tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c2_072f
n16_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c2_072f_cond,
n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f
result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c2_072f
t16_MUX_uxn_opcodes_h_l909_c2_072f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c2_072f_cond,
t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue,
t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse,
t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

-- printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748
printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748 : entity work.printf_uxn_opcodes_h_l910_c3_b748_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545
BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output);

-- tmp16_MUX_uxn_opcodes_h_l914_c7_c795
tmp16_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond,
tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- n16_MUX_uxn_opcodes_h_l914_c7_c795
n16_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l914_c7_c795_cond,
n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795
result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- t16_MUX_uxn_opcodes_h_l914_c7_c795
t16_MUX_uxn_opcodes_h_l914_c7_c795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l914_c7_c795_cond,
t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue,
t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse,
t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f
BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l917_c7_403b
tmp16_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond,
tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- n16_MUX_uxn_opcodes_h_l917_c7_403b
n16_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l917_c7_403b_cond,
n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b
result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- t16_MUX_uxn_opcodes_h_l917_c7_403b
t16_MUX_uxn_opcodes_h_l917_c7_403b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l917_c7_403b_cond,
t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue,
t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse,
t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be
BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_edf0
tmp16_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_edf0
n16_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0
result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- t16_MUX_uxn_opcodes_h_l922_c7_edf0
t16_MUX_uxn_opcodes_h_l922_c7_edf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond,
t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue,
t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse,
t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l923_c3_06df
BIN_OP_OR_uxn_opcodes_h_l923_c3_06df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left,
BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right,
BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1
BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_6c09
tmp16_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_6c09
n16_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09
result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7
BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c7_64c2
tmp16_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c7_64c2
n16_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2
result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51
BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left,
BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right,
BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l932_c11_3305
BIN_OP_AND_uxn_opcodes_h_l932_c11_3305 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left,
BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right,
BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output);

-- sp_relative_shift_uxn_opcodes_h_l934_c30_9c49
sp_relative_shift_uxn_opcodes_h_l934_c30_9c49 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins,
sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x,
sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y,
sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be
BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421
result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output);

-- CONST_SR_8_uxn_opcodes_h_l942_c31_537a
CONST_SR_8_uxn_opcodes_h_l942_c31_537a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x,
CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d
BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output,
 tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output,
 tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output,
 BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output,
 sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output,
 CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_0e71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_9032 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_f677 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_5384 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_c7c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_3851_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_184f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_55eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a100_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l949_l905_DUPLICATE_798a_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_0e71 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_0e71;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_9032 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_9032;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_5384 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_5384;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_184f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_184f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_c7c9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_c7c9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_f677 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_f677;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l942_c31_537a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output := CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_20f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l934_c30_9c49] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_ins;
     sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_x;
     sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output := sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_54be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c6_e9a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_f545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_32be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a100 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a100_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_e48f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_425d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_8ef1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e9a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_f545_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_e48f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_54be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_8ef1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_20f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_32be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_425d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l923_l927_l931_DUPLICATE_1171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l930_DUPLICATE_2208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l939_l930_DUPLICATE_0093_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_5d3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l914_l944_l909_l939_DUPLICATE_24ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a100_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a100_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l926_l922_l917_l914_l909_l939_DUPLICATE_f1cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_9c49_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_a33c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_a33c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_d5ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l923_c3_06df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_left;
     BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output := BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_e421] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l942_c21_55eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_55eb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_537a_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l931_c3_9a51] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_left;
     BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output := BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_e421] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_06df_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_9a51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_55eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_29a7_return_output;
     VAR_printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_d5ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_a33c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_e421_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_a33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_e421_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l932_c11_3305] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_left;
     BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output := BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_e421] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output;

     -- n16_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l939_c7_e421] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output;

     -- printf_uxn_opcodes_h_l910_c3_b748[uxn_opcodes_h_l910_c3_b748] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l910_c3_b748_uxn_opcodes_h_l910_c3_b748_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_e421] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_e421_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_e421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_e421_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l937_c21_3851] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_3851_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_3305_return_output);

     -- t16_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output := t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- n16_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_3851_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_t16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_64c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output := t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_64c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- n16_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output := n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- t16_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output := t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l926_c7_6c09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output := result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_n16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_6c09_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- n16_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output := n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output := tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l922_c7_edf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_edf0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output := n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output := tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_403b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_403b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l914_c7_c795] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_cond;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output := result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output := tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_c795_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_072f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l909_c2_072f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l949_l905_DUPLICATE_798a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l949_l905_DUPLICATE_798a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_072f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_072f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l949_l905_DUPLICATE_798a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l949_l905_DUPLICATE_798a_return_output;
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
