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
-- Submodules: 91
entity equ2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_c96e1a89;
architecture arch of equ2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_ae8c]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_6127]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1262_c2_8964]
signal n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_8964]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1262_c2_8964]
signal t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1263_c3_c101[uxn_opcodes_h_l1263_c3_c101]
signal printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_9508]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1267_c7_26dd]
signal t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_5830]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1270_c7_d657]
signal n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_d657]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1270_c7_d657]
signal t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_ea8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1275_c7_1603]
signal n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_1603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1275_c7_1603]
signal t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_16a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c7_6f36]
signal t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1279_c3_2928]
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_e547]
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1282_c7_a117]
signal n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_a117]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_9f7f]
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_d3b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_f0a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_1379]
signal n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_1379]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_1476]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_b2c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1294_c3_42af]
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1296_c30_5d52]
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c21_0059]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1299_c21_9918]
signal MUX_uxn_opcodes_h_l1299_c21_9918_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_9918_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_9918_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_9918_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1301_c11_b6e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1301_c7_5e78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1301_c7_5e78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1301_c7_5e78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output);

-- n16_MUX_uxn_opcodes_h_l1262_c2_8964
n16_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- t16_MUX_uxn_opcodes_h_l1262_c2_8964
t16_MUX_uxn_opcodes_h_l1262_c2_8964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond,
t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue,
t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse,
t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

-- printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101
printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101 : entity work.printf_uxn_opcodes_h_l1263_c3_c101_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output);

-- n16_MUX_uxn_opcodes_h_l1267_c7_26dd
n16_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- t16_MUX_uxn_opcodes_h_l1267_c7_26dd
t16_MUX_uxn_opcodes_h_l1267_c7_26dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond,
t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue,
t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse,
t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output);

-- n16_MUX_uxn_opcodes_h_l1270_c7_d657
n16_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- t16_MUX_uxn_opcodes_h_l1270_c7_d657
t16_MUX_uxn_opcodes_h_l1270_c7_d657 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond,
t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue,
t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse,
t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1275_c7_1603
n16_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- t16_MUX_uxn_opcodes_h_l1275_c7_1603
t16_MUX_uxn_opcodes_h_l1275_c7_1603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond,
t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue,
t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse,
t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c7_6f36
n16_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c7_6f36
t16_MUX_uxn_opcodes_h_l1278_c7_6f36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond,
t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928
BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left,
BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right,
BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output);

-- n16_MUX_uxn_opcodes_h_l1282_c7_a117
n16_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output);

-- n16_MUX_uxn_opcodes_h_l1285_c7_d3b1
n16_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_1379
n16_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_b2c1
n16_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af
BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52
sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins,
sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x,
sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y,
sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output);

-- MUX_uxn_opcodes_h_l1299_c21_9918
MUX_uxn_opcodes_h_l1299_c21_9918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1299_c21_9918_cond,
MUX_uxn_opcodes_h_l1299_c21_9918_iftrue,
MUX_uxn_opcodes_h_l1299_c21_9918_iffalse,
MUX_uxn_opcodes_h_l1299_c21_9918_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output,
 n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output,
 n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output,
 n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output,
 n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output,
 n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output,
 n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output,
 sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output,
 MUX_uxn_opcodes_h_l1299_c21_9918_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_5dd6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_6cc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5579 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_b406 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_ea42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_1fa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_4724 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_757c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_aa36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_b2c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_9918_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_9918_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1258_l1307_DUPLICATE_6d24_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_4724 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_4724;
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5579 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5579;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_aa36 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_aa36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_6cc3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_6cc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_ea42 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_ea42;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_1fa0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_1fa0;
     VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_5dd6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_5dd6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_757c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_757c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_b406 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_b406;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_ae8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_b2c1_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1296_c30_5d52] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_ins;
     sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_x;
     sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output := sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_16a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_9508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1301_c11_b6e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_ea8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_f0a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_1476] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_e547] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_left;
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output := BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_9f7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_5830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_ae8c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_9508_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_5830_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_ea8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_16a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_e547_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9f7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_f0a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_1476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_b6e1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1279_l1286_l1271_l1294_DUPLICATE_7aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_754d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1293_l1267_l1290_l1285_l1282_l1278_DUPLICATE_1d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_0cf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1275_l1301_l1270_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_9922_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_DUPLICATE_3ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_5d52_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1301_c7_5e78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1301_c7_5e78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1279_c3_2928] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_left;
     BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output := BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1294_c3_42af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_left;
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output := BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_6127] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1301_c7_5e78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_2928_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_42af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1272_l1287_DUPLICATE_011b_return_output;
     VAR_printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_6127_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_5e78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c21_0059] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output;

     -- t16_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- printf_uxn_opcodes_h_l1263_c3_c101[uxn_opcodes_h_l1263_c3_c101] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1263_c3_c101_uxn_opcodes_h_l1263_c3_c101_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1299_c21_9918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_0059_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     -- MUX[uxn_opcodes_h_l1299_c21_9918] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1299_c21_9918_cond <= VAR_MUX_uxn_opcodes_h_l1299_c21_9918_cond;
     MUX_uxn_opcodes_h_l1299_c21_9918_iftrue <= VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iftrue;
     MUX_uxn_opcodes_h_l1299_c21_9918_iffalse <= VAR_MUX_uxn_opcodes_h_l1299_c21_9918_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1299_c21_9918_return_output := MUX_uxn_opcodes_h_l1299_c21_9918_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue := VAR_MUX_uxn_opcodes_h_l1299_c21_9918_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_b2c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_b2c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     -- n16_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_1379] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- t16_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_1379_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- t16_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_d3b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_d3b1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;
     -- n16_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1282_c7_a117] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output := result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a117_return_output;
     -- n16_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_6f36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_6f36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_1603] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output := result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_1603_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- n16_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_d657] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_d657_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_26dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_26dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_8964] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1258_l1307_DUPLICATE_6d24 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1258_l1307_DUPLICATE_6d24_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_8964_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_8964_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1258_l1307_DUPLICATE_6d24_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1258_l1307_DUPLICATE_6d24_return_output;
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
