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
-- Submodules: 98
entity neq2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_5ccafc54;
architecture arch of neq2_0CLK_5ccafc54 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1383_c6_7303]
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1383_c1_a874]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c2_cff8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1384_c3_7e08[uxn_opcodes_h_l1384_c3_7e08]
signal printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_997c]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_4e44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_ea6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1391_c7_b808]
signal t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1391_c7_b808]
signal n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_b808]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_e948]
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_4f26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_7ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1399_c7_526f]
signal t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1399_c7_526f]
signal n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_526f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1400_c3_6911]
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_7472]
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_eba6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_5ca0]
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_61d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0b23]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1411_c7_153c]
signal n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_153c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_99c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1414_c7_9702]
signal n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_9702]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_2e8e]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1417_c32_1297]
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1417_c32_5f34]
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1417_c32_dea0]
signal MUX_uxn_opcodes_h_l1417_c32_dea0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_dea0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_f567]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_75a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_75a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_75a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1419_c7_75a7]
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_75a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c24_f217]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1423_c24_54b8]
signal MUX_uxn_opcodes_h_l1423_c24_54b8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_54b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_73ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_632c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_632c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left,
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right,
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output);

-- t16_MUX_uxn_opcodes_h_l1383_c2_cff8
t16_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- n16_MUX_uxn_opcodes_h_l1383_c2_cff8
n16_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

-- printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08
printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08 : entity work.printf_uxn_opcodes_h_l1384_c3_7e08_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output);

-- t16_MUX_uxn_opcodes_h_l1388_c7_4e44
t16_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- n16_MUX_uxn_opcodes_h_l1388_c7_4e44
n16_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1391_c7_b808
t16_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- n16_MUX_uxn_opcodes_h_l1391_c7_b808
n16_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output);

-- t16_MUX_uxn_opcodes_h_l1396_c7_4f26
t16_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- n16_MUX_uxn_opcodes_h_l1396_c7_4f26
n16_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output);

-- t16_MUX_uxn_opcodes_h_l1399_c7_526f
t16_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- n16_MUX_uxn_opcodes_h_l1399_c7_526f
n16_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911
BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left,
BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right,
BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output);

-- n16_MUX_uxn_opcodes_h_l1403_c7_eba6
n16_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output);

-- n16_MUX_uxn_opcodes_h_l1406_c7_61d3
n16_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output);

-- n16_MUX_uxn_opcodes_h_l1411_c7_153c
n16_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1414_c7_9702
n16_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297
BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left,
BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right,
BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34
BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left,
BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right,
BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output);

-- MUX_uxn_opcodes_h_l1417_c32_dea0
MUX_uxn_opcodes_h_l1417_c32_dea0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1417_c32_dea0_cond,
MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue,
MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse,
MUX_uxn_opcodes_h_l1417_c32_dea0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output);

-- MUX_uxn_opcodes_h_l1423_c24_54b8
MUX_uxn_opcodes_h_l1423_c24_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1423_c24_54b8_cond,
MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue,
MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse,
MUX_uxn_opcodes_h_l1423_c24_54b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output,
 t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output,
 t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output,
 t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output,
 t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output,
 t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output,
 n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output,
 n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output,
 n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output,
 n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output,
 MUX_uxn_opcodes_h_l1417_c32_dea0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output,
 MUX_uxn_opcodes_h_l1423_c24_54b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3ed4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_cd9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_4f56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_4c92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_a030 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4892 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_396f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_2951 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_8830 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1414_DUPLICATE_0f70_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1430_l1379_DUPLICATE_01b6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right := to_unsigned(10, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_396f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_396f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_4c92 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_4c92;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4892 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4892;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3ed4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3ed4;
     VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_4f56 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_4f56;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_8830 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_8830;
     VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_2951 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_2951;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_a030 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_a030;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_cd9a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_cd9a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_ea6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_e948] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_left;
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output := BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_f567] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1414_DUPLICATE_0f70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1414_DUPLICATE_0f70_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l1417_c32_1297] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_left;
     BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output := BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_7472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_left;
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output := BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_73ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1383_c6_7303] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_left;
     BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output := BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c24_f217] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_7ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_99c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_997c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_5ca0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_1297_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_7303_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_997c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_ea6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_e948_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7ca3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7472_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_5ca0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0b23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_99c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_f567_return_output;
     VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_f217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_73ea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1407_l1400_l1392_l1415_DUPLICATE_725b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_48f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1419_l1391_l1414_l1388_l1411_l1406_DUPLICATE_5b69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1388_l1411_l1383_l1406_DUPLICATE_c183_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1403_l1399_l1425_l1396_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_172d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1414_DUPLICATE_0f70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1414_DUPLICATE_0f70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1399_l1396_l1419_l1391_l1414_l1388_l1411_l1383_l1406_DUPLICATE_0c8b_return_output;
     -- MUX[uxn_opcodes_h_l1423_c24_54b8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1423_c24_54b8_cond <= VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_cond;
     MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue <= VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iftrue;
     MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse <= VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_return_output := MUX_uxn_opcodes_h_l1423_c24_54b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_75a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1417_c32_5f34] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_left;
     BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output := BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_632c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1383_c1_a874] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_632c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1400_c3_6911] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_left;
     BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output := BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_75a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_2e8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_5f34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_6911_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2e8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_c372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue := VAR_MUX_uxn_opcodes_h_l1423_c24_54b8_return_output;
     VAR_printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1383_c1_a874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_632c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_632c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;
     -- t16_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1419_c7_75a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_75a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;

     -- MUX[uxn_opcodes_h_l1417_c32_dea0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1417_c32_dea0_cond <= VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_cond;
     MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue <= VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iftrue;
     MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse <= VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_return_output := MUX_uxn_opcodes_h_l1417_c32_dea0_return_output;

     -- printf_uxn_opcodes_h_l1384_c3_7e08[uxn_opcodes_h_l1384_c3_7e08] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1384_c3_7e08_uxn_opcodes_h_l1384_c3_7e08_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_75a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue := VAR_MUX_uxn_opcodes_h_l1417_c32_dea0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_75a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- n16_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_9702] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output := result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_9702_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_153c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_153c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_61d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_61d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     -- n16_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_eba6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_eba6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_526f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_526f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_4f26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;

     -- n16_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_4f26_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- n16_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_b808] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_b808_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_4e44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;

     -- n16_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_4e44_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c2_cff8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1430_l1379_DUPLICATE_01b6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1430_l1379_DUPLICATE_01b6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_cff8_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1430_l1379_DUPLICATE_01b6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1430_l1379_DUPLICATE_01b6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
