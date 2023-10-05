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
-- Submodules: 123
entity eor2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_201aeef3;
architecture arch of eor2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1079_c6_dfd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1079_c1_736c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1079_c2_ff71]
signal t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1080_c3_ebdf[uxn_opcodes_h_l1080_c3_ebdf]
signal printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_be78]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1085_c7_4acb]
signal t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_4a99]
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1088_c7_0693]
signal n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_0693]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1088_c7_0693]
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1088_c7_0693]
signal t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_4f7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1093_c7_bca8]
signal t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_80ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1096_c7_2d17]
signal t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1097_c3_794f]
signal BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1100_c11_d0db]
signal BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1100_c7_269d]
signal n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1100_c7_269d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1100_c7_269d]
signal tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1103_c11_df08]
signal BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1103_c7_e465]
signal n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1103_c7_e465]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1103_c7_e465]
signal tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_2731]
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1108_c7_ac6d]
signal tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_98f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c7_b3a5]
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1112_c3_2aef]
signal BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1113_c11_e895]
signal BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1116_c32_c14a]
signal BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1116_c32_5ce3]
signal BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1116_c32_5147]
signal MUX_uxn_opcodes_h_l1116_c32_5147_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1116_c32_5147_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1116_c32_5147_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1116_c32_5147_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1118_c11_7ecb]
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1118_c7_ab45]
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1118_c7_ab45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1118_c7_ab45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1118_c7_ab45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1118_c7_ab45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_0048]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1124_c7_0def]
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_0def]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_0def]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_0def]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1126_c34_80df]
signal CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_3b10]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_bca2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_bca2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output);

-- n16_MUX_uxn_opcodes_h_l1079_c2_ff71
n16_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71
result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71
tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- t16_MUX_uxn_opcodes_h_l1079_c2_ff71
t16_MUX_uxn_opcodes_h_l1079_c2_ff71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond,
t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue,
t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse,
t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

-- printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf
printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf : entity work.printf_uxn_opcodes_h_l1080_c3_ebdf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output);

-- n16_MUX_uxn_opcodes_h_l1085_c7_4acb
n16_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb
tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- t16_MUX_uxn_opcodes_h_l1085_c7_4acb
t16_MUX_uxn_opcodes_h_l1085_c7_4acb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond,
t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue,
t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse,
t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output);

-- n16_MUX_uxn_opcodes_h_l1088_c7_0693
n16_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693
result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693
result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1088_c7_0693
tmp16_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- t16_MUX_uxn_opcodes_h_l1088_c7_0693
t16_MUX_uxn_opcodes_h_l1088_c7_0693 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond,
t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue,
t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse,
t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output);

-- n16_MUX_uxn_opcodes_h_l1093_c7_bca8
n16_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8
tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- t16_MUX_uxn_opcodes_h_l1093_c7_bca8
t16_MUX_uxn_opcodes_h_l1093_c7_bca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond,
t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue,
t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse,
t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1096_c7_2d17
n16_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17
tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- t16_MUX_uxn_opcodes_h_l1096_c7_2d17
t16_MUX_uxn_opcodes_h_l1096_c7_2d17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond,
t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue,
t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse,
t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f
BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left,
BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right,
BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db
BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left,
BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right,
BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output);

-- n16_MUX_uxn_opcodes_h_l1100_c7_269d
n16_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d
result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d
result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d
result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d
result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d
result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1100_c7_269d
tmp16_MUX_uxn_opcodes_h_l1100_c7_269d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond,
tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08
BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left,
BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right,
BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output);

-- n16_MUX_uxn_opcodes_h_l1103_c7_e465
n16_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465
result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465
result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465
result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465
result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465
result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465
result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1103_c7_e465
tmp16_MUX_uxn_opcodes_h_l1103_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond,
tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue,
tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse,
tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output);

-- n16_MUX_uxn_opcodes_h_l1108_c7_ac6d
n16_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d
tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond,
tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c7_b3a5
n16_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5
tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef
BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left,
BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right,
BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895
BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left,
BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right,
BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a
BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left,
BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right,
BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3
BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left,
BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right,
BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output);

-- MUX_uxn_opcodes_h_l1116_c32_5147
MUX_uxn_opcodes_h_l1116_c32_5147 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1116_c32_5147_cond,
MUX_uxn_opcodes_h_l1116_c32_5147_iftrue,
MUX_uxn_opcodes_h_l1116_c32_5147_iffalse,
MUX_uxn_opcodes_h_l1116_c32_5147_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left,
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right,
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1126_c34_80df
CONST_SR_8_uxn_opcodes_h_l1126_c34_80df : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x,
CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output,
 n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output,
 n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output,
 n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output,
 n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output,
 n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output,
 n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output,
 n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output,
 n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output,
 MUX_uxn_opcodes_h_l1116_c32_5147_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output,
 CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9d57 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_1b07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_23c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_127b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_543e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1101_c3_e228 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_278b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_cb58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1116_c32_5147_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1116_c32_5147_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_fc83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c24_83bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_df30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c24_f4b4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1124_l1111_DUPLICATE_f323_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1133_l1075_DUPLICATE_d459_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9d57 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9d57;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_543e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_543e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_278b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_278b;
     VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1101_c3_e228 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1101_c3_e228;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_23c1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_23c1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_cb58 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_cb58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_fc83 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_fc83;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_df30 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_df30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_127b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_127b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_1b07 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_1b07;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1100_c11_d0db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1118_c11_7ecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1124_l1111_DUPLICATE_f323 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1124_l1111_DUPLICATE_f323_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1126_c34_80df] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output := CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_98f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_2731] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_left;
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output := BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_0048] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1116_c32_c14a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_left;
     BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output := BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_80ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1122_c24_83bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c24_83bb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_be78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1103_c11_df08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_3b10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c6_dfd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_4f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_4a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1116_c32_c14a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_dfd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_be78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_4a99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_4f7c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_80ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1100_c11_d0db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1103_c11_df08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_2731_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_98f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_7ecb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_0048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_3b10_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1097_l1104_l1089_l1112_DUPLICATE_6c92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c24_83bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_e89b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1118_l1088_l1111_l1085_l1108_l1103_DUPLICATE_d15a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1118_l1088_l1085_l1108_l1079_l1103_DUPLICATE_d729_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1100_l1096_l1093_l1088_l1111_l1085_l1108_l1103_DUPLICATE_592b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1100_l1128_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_1d43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1124_l1111_DUPLICATE_f323_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1124_l1111_DUPLICATE_f323_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1100_l1096_l1124_l1093_l1088_l1111_l1085_l1108_l1079_l1103_DUPLICATE_781e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1116_c32_5ce3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_left;
     BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output := BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_bca2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1112_c3_2aef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_left;
     BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output := BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1118_c7_ab45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_0def] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1126_c24_f4b4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c24_f4b4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c34_80df_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1079_c1_736c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_bca2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1097_c3_794f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_left;
     BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output := BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1116_c32_5147_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1116_c32_5ce3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1097_c3_794f_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c3_2aef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c24_f4b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1105_l1090_DUPLICATE_d8e8_return_output;
     VAR_printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1079_c1_736c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_bca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;
     -- printf_uxn_opcodes_h_l1080_c3_ebdf[uxn_opcodes_h_l1080_c3_ebdf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1080_c3_ebdf_uxn_opcodes_h_l1080_c3_ebdf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- MUX[uxn_opcodes_h_l1116_c32_5147] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1116_c32_5147_cond <= VAR_MUX_uxn_opcodes_h_l1116_c32_5147_cond;
     MUX_uxn_opcodes_h_l1116_c32_5147_iftrue <= VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iftrue;
     MUX_uxn_opcodes_h_l1116_c32_5147_iffalse <= VAR_MUX_uxn_opcodes_h_l1116_c32_5147_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1116_c32_5147_return_output := MUX_uxn_opcodes_h_l1116_c32_5147_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1118_c7_ab45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_0def] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;

     -- t16_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_0def] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1124_c7_0def] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output := result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1113_c11_e895] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_left;
     BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output := BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1113_c11_e895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue := VAR_MUX_uxn_opcodes_h_l1116_c32_5147_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_0def_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     -- t16_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1118_c7_ab45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output := result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1118_c7_ab45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1118_c7_ab45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_ab45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_b3a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_ac6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_ac6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- n16_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1103_c7_e465] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1103_c7_e465_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- n16_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1100_c7_269d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1100_c7_269d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- n16_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_2d17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_2d17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_bca8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_bca8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_0693] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1088_c7_0693_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_4acb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_4acb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c2_ff71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1133_l1075_DUPLICATE_d459 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1133_l1075_DUPLICATE_d459_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_ff71_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1133_l1075_DUPLICATE_d459_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1133_l1075_DUPLICATE_d459_return_output;
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
