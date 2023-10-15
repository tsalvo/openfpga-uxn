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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 96
entity neq2_0CLK_c7083908 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_c7083908;
architecture arch of neq2_0CLK_c7083908 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1383_c6_2a6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1383_c2_b8db]
signal n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_6071]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1388_c7_dd56]
signal n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_9ffc]
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1391_c7_caef]
signal t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_caef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1391_c7_caef]
signal n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_6765]
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1396_c7_7441]
signal t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_7441]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1396_c7_7441]
signal n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_7b23]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1399_c7_26cb]
signal n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1400_c3_7077]
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_7c61]
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_600b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1403_c7_600b]
signal n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_b013]
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_620b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1406_c7_620b]
signal n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0995]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_8078]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1411_c7_8078]
signal n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_7bc5]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1414_c7_ea0a]
signal n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_e2e2]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1417_c32_31b8]
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1417_c32_4e71]
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1417_c32_37ad]
signal MUX_uxn_opcodes_h_l1417_c32_37ad_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1417_c32_37ad_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_b19f]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1419_c7_dc15]
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_dc15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_dc15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_dc15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_dc15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c24_08f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1423_c24_430f]
signal MUX_uxn_opcodes_h_l1423_c24_430f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_430f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_430f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1423_c24_430f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_17a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_e603]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_e603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output);

-- t16_MUX_uxn_opcodes_h_l1383_c2_b8db
t16_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- n16_MUX_uxn_opcodes_h_l1383_c2_b8db
n16_MUX_uxn_opcodes_h_l1383_c2_b8db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond,
n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue,
n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse,
n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output);

-- t16_MUX_uxn_opcodes_h_l1388_c7_dd56
t16_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- n16_MUX_uxn_opcodes_h_l1388_c7_dd56
n16_MUX_uxn_opcodes_h_l1388_c7_dd56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond,
n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue,
n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse,
n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right,
BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output);

-- t16_MUX_uxn_opcodes_h_l1391_c7_caef
t16_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- n16_MUX_uxn_opcodes_h_l1391_c7_caef
n16_MUX_uxn_opcodes_h_l1391_c7_caef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond,
n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue,
n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse,
n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right,
BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output);

-- t16_MUX_uxn_opcodes_h_l1396_c7_7441
t16_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- n16_MUX_uxn_opcodes_h_l1396_c7_7441
n16_MUX_uxn_opcodes_h_l1396_c7_7441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond,
n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue,
n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse,
n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output);

-- t16_MUX_uxn_opcodes_h_l1399_c7_26cb
t16_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1399_c7_26cb
n16_MUX_uxn_opcodes_h_l1399_c7_26cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond,
n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue,
n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse,
n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077
BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left,
BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right,
BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- n16_MUX_uxn_opcodes_h_l1403_c7_600b
n16_MUX_uxn_opcodes_h_l1403_c7_600b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond,
n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue,
n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse,
n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- n16_MUX_uxn_opcodes_h_l1406_c7_620b
n16_MUX_uxn_opcodes_h_l1406_c7_620b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond,
n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue,
n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse,
n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- n16_MUX_uxn_opcodes_h_l1411_c7_8078
n16_MUX_uxn_opcodes_h_l1411_c7_8078 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond,
n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue,
n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse,
n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1414_c7_ea0a
n16_MUX_uxn_opcodes_h_l1414_c7_ea0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond,
n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue,
n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse,
n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2
BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8
BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left,
BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right,
BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71
BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left,
BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right,
BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output);

-- MUX_uxn_opcodes_h_l1417_c32_37ad
MUX_uxn_opcodes_h_l1417_c32_37ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1417_c32_37ad_cond,
MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue,
MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse,
MUX_uxn_opcodes_h_l1417_c32_37ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output);

-- MUX_uxn_opcodes_h_l1423_c24_430f
MUX_uxn_opcodes_h_l1423_c24_430f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1423_c24_430f_cond,
MUX_uxn_opcodes_h_l1423_c24_430f_iftrue,
MUX_uxn_opcodes_h_l1423_c24_430f_iffalse,
MUX_uxn_opcodes_h_l1423_c24_430f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output,
 t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output,
 t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output,
 t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output,
 t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output,
 t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output,
 MUX_uxn_opcodes_h_l1417_c32_37ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output,
 MUX_uxn_opcodes_h_l1423_c24_430f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3f2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_014f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_b278 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_2120 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_9f92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4353 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_b3f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_5212 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_9514 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_430f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1423_c24_430f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1414_l1419_DUPLICATE_053a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1430_l1379_DUPLICATE_a8d2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_5212 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_5212;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3f2a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_3f2a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_2120 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_2120;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_014f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_014f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_b278 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1394_c3_b278;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4353 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_4353;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_9f92 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1401_c3_9f92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_b3f8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_b3f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_9514 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_9514;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_7b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_b013] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_left;
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output := BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_b19f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1417_c32_31b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_left;
     BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output := BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_17a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1391_c11_9ffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_7bc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1383_c6_2a6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_7c61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0995] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1396_c11_6765] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_left;
     BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output := BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_6071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c24_08f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1414_l1419_DUPLICATE_053a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1414_l1419_DUPLICATE_053a_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1417_c32_31b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c6_2a6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_6071_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c11_9ffc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1396_c11_6765_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_7b23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_7c61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_b013_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0995_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7bc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_b19f_return_output;
     VAR_MUX_uxn_opcodes_h_l1423_c24_430f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c24_08f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_17a3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1400_l1415_l1392_l1407_DUPLICATE_9409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_DUPLICATE_9a4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1406_l1403_l1399_l1425_l1396_l1419_DUPLICATE_9564_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1391_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_8712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1425_l1396_DUPLICATE_23dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1414_l1419_DUPLICATE_053a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1414_l1419_DUPLICATE_053a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1391_l1414_l1388_l1411_l1383_l1406_l1403_l1399_l1396_l1419_DUPLICATE_1c38_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_dc15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;

     -- MUX[uxn_opcodes_h_l1423_c24_430f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1423_c24_430f_cond <= VAR_MUX_uxn_opcodes_h_l1423_c24_430f_cond;
     MUX_uxn_opcodes_h_l1423_c24_430f_iftrue <= VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iftrue;
     MUX_uxn_opcodes_h_l1423_c24_430f_iffalse <= VAR_MUX_uxn_opcodes_h_l1423_c24_430f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1423_c24_430f_return_output := MUX_uxn_opcodes_h_l1423_c24_430f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_dc15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_e603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1400_c3_7077] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_left;
     BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output := BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1417_c32_4e71] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_left;
     BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output := BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_e603] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_e2e2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1417_c32_4e71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1400_c3_7077_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_e2e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1393_l1408_DUPLICATE_f7da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue := VAR_MUX_uxn_opcodes_h_l1423_c24_430f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_e603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_e603_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1419_c7_dc15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output := result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_dc15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;

     -- MUX[uxn_opcodes_h_l1417_c32_37ad] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1417_c32_37ad_cond <= VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_cond;
     MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue <= VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iftrue;
     MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse <= VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_return_output := MUX_uxn_opcodes_h_l1417_c32_37ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_dc15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue := VAR_MUX_uxn_opcodes_h_l1417_c32_37ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1419_c7_dc15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- n16_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_ea0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_ea0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_8078] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;

     -- t16_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_8078_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- n16_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_620b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_620b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_600b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_600b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_26cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_26cb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1396_c7_7441] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output := result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1396_c7_7441_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1391_c7_caef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1391_c7_caef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- n16_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_dd56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_dd56_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c2_b8db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1430_l1379_DUPLICATE_a8d2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1430_l1379_DUPLICATE_a8d2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c2_b8db_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1430_l1379_DUPLICATE_a8d2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1430_l1379_DUPLICATE_a8d2_return_output;
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
