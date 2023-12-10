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
-- Submodules: 71
entity ora2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_4712a73c;
architecture arch of ora2_0CLK_4712a73c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1008_c6_c2c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c2_c8ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_1d39]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c7_c04f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_e011]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1018_c7_6d21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_fa06]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_e4e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1024_c3_3452]
signal BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_b86b]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1027_c7_e634]
signal n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1027_c7_e634]
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1027_c7_e634]
signal result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_e634]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_e634]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_e634]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_e634]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_527d]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_0d4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1032_c3_507d]
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1033_c11_fdaf]
signal BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1035_c30_9e3a]
signal sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_1094]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1040_c7_1435]
signal result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_1435]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_1435]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_1435]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_1435]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1043_c31_246e]
signal CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_3025]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_f87b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_f87b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5
BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output);

-- n16_MUX_uxn_opcodes_h_l1008_c2_c8ea
n16_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- t16_MUX_uxn_opcodes_h_l1008_c2_c8ea
t16_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea
tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea
result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output);

-- n16_MUX_uxn_opcodes_h_l1015_c7_c04f
n16_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- t16_MUX_uxn_opcodes_h_l1015_c7_c04f
t16_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f
tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f
result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output);

-- n16_MUX_uxn_opcodes_h_l1018_c7_6d21
n16_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- t16_MUX_uxn_opcodes_h_l1018_c7_6d21
t16_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21
tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output);

-- n16_MUX_uxn_opcodes_h_l1023_c7_e4e2
n16_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- t16_MUX_uxn_opcodes_h_l1023_c7_e4e2
t16_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2
tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452
BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left,
BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right,
BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output);

-- n16_MUX_uxn_opcodes_h_l1027_c7_e634
n16_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1027_c7_e634
tmp16_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634
result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output);

-- n16_MUX_uxn_opcodes_h_l1031_c7_0d4e
n16_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e
tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e
result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d
BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf
BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left,
BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right,
BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a
sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins,
sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x,
sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y,
sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435
result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond,
result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1043_c31_246e
CONST_SR_8_uxn_opcodes_h_l1043_c31_246e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x,
CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984
CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output,
 n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output,
 n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output,
 n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output,
 n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output,
 n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output,
 n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output,
 CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_76ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_20c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_809d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_3204 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_2bc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1038_c21_f685_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_34fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1041_c3_0931 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1043_c21_7e6e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1040_l1027_DUPLICATE_f54f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1050_l1004_DUPLICATE_e2a2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_2bc1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_2bc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_20c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_20c7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_76ce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_76ce;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_34fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1042_c3_34fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_3204 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_3204;
     VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_809d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_809d;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1041_c3_0931 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1041_c3_0931;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_1094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_b86b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_527d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c6_c2c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1043_c31_246e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output := CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_3025] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_fa06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1040_l1027_DUPLICATE_f54f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1040_l1027_DUPLICATE_f54f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_1d39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_e011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1035_c30_9e3a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_ins;
     sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_x;
     sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output := sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c6_c2c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_1d39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_e011_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_fa06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b86b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_527d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3025_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1019_l1028_l1032_l1024_DUPLICATE_f3c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_5dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1031_l1027_l1045_l1015_l1040_l1018_l1023_DUPLICATE_0b41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1027_l1045_l1015_l1040_l1018_l1008_l1023_DUPLICATE_4165_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1040_l1027_DUPLICATE_f54f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1040_l1027_DUPLICATE_f54f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1027_l1015_l1040_l1018_l1008_l1023_DUPLICATE_0290_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1035_c30_9e3a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1032_c3_507d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_left;
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output := BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_1435] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_1435] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1043_c21_7e6e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1043_c21_7e6e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1043_c31_246e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_f87b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1024_c3_3452] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_left;
     BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output := BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_f87b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1024_c3_3452_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_507d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1043_c21_7e6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1029_l1020_DUPLICATE_0984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_f87b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;
     -- t16_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1033_c11_fdaf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_left;
     BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output := BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1040_c7_1435] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output := result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_1435] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_1435] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1040_c7_1435_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- n16_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- t16_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1038_c21_f685] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1038_c21_f685_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1033_c11_fdaf_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1038_c21_f685_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1031_c7_0d4e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1031_c7_0d4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1027_c7_e634] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output := result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- t16_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1027_c7_e634_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_e4e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e4e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_6d21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- n16_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_6d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1015_c7_c04f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1015_c7_c04f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1008_c2_c8ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1050_l1004_DUPLICATE_e2a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1050_l1004_DUPLICATE_e2a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c2_c8ea_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1050_l1004_DUPLICATE_e2a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1050_l1004_DUPLICATE_e2a2_return_output;
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
