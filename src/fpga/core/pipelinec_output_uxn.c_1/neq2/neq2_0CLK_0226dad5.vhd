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
-- Submodules: 58
entity neq2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_0226dad5;
architecture arch of neq2_0CLK_0226dad5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1252_c6_9730]
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c2_1fac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_a15a]
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_9b46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_cff7]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_e0a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_7b2e]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_aa5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1268_c3_8f04]
signal BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1271_c11_2455]
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1271_c7_90e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_6f8d]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_9e4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1276_c3_f4b5]
signal BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1278_c30_bba7]
signal sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c21_a59a]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1281_c21_9834]
signal MUX_uxn_opcodes_h_l1281_c21_9834_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1281_c21_9834_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1281_c21_9834_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1281_c21_9834_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_b90e]
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_04ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_04ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_04ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : signed(3 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730
BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left,
BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right,
BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output);

-- n16_MUX_uxn_opcodes_h_l1252_c2_1fac
n16_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- t16_MUX_uxn_opcodes_h_l1252_c2_1fac
t16_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac
result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output);

-- n16_MUX_uxn_opcodes_h_l1259_c7_9b46
n16_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- t16_MUX_uxn_opcodes_h_l1259_c7_9b46
t16_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output);

-- n16_MUX_uxn_opcodes_h_l1262_c7_e0a1
n16_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- t16_MUX_uxn_opcodes_h_l1262_c7_e0a1
t16_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output);

-- n16_MUX_uxn_opcodes_h_l1267_c7_aa5a
n16_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- t16_MUX_uxn_opcodes_h_l1267_c7_aa5a
t16_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04
BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left,
BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right,
BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left,
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right,
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output);

-- n16_MUX_uxn_opcodes_h_l1271_c7_90e8
n16_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8
result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output);

-- n16_MUX_uxn_opcodes_h_l1275_c7_9e4b
n16_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5
BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left,
BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right,
BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7
sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins,
sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x,
sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y,
sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a
BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output);

-- MUX_uxn_opcodes_h_l1281_c21_9834
MUX_uxn_opcodes_h_l1281_c21_9834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1281_c21_9834_cond,
MUX_uxn_opcodes_h_l1281_c21_9834_iftrue,
MUX_uxn_opcodes_h_l1281_c21_9834_iffalse,
MUX_uxn_opcodes_h_l1281_c21_9834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71
CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output,
 n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output,
 n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output,
 n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output,
 n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output,
 n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output,
 n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output,
 MUX_uxn_opcodes_h_l1281_c21_9834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_c404 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_ba28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1265_c3_2424 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_309d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_21c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1281_c21_9834_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1281_c21_9834_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1284_c3_969e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1275_l1271_DUPLICATE_eb02_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1289_l1248_DUPLICATE_da71_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1284_c3_969e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1284_c3_969e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_c404 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_c404;
     VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_ba28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_ba28;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_21c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_21c5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_309d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_309d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1265_c3_2424 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1265_c3_2424;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_7b2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1252_c6_9730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_left;
     BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output := BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_6f8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1278_c30_bba7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_ins;
     sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_x;
     sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output := sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1275_l1271_DUPLICATE_eb02 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1275_l1271_DUPLICATE_eb02_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_a15a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_cff7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_b90e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1271_c11_2455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_left;
     BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output := BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c6_9730_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_a15a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_cff7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_7b2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_2455_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6f8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_b90e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1263_l1276_l1268_l1272_DUPLICATE_4cfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_5df2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1267_l1262_l1283_DUPLICATE_dff0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1259_l1271_l1252_l1267_l1262_l1283_DUPLICATE_004c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1275_l1271_DUPLICATE_eb02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1275_l1271_DUPLICATE_eb02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1275_l1259_l1271_l1252_l1267_l1262_DUPLICATE_4b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1278_c30_bba7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1268_c3_8f04] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_left;
     BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output := BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1276_c3_f4b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_left;
     BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output := BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_04ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_04ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_04ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1268_c3_8f04_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1276_c3_f4b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1264_l1273_DUPLICATE_da71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_04ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c21_a59a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1281_c21_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c21_a59a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- MUX[uxn_opcodes_h_l1281_c21_9834] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1281_c21_9834_cond <= VAR_MUX_uxn_opcodes_h_l1281_c21_9834_cond;
     MUX_uxn_opcodes_h_l1281_c21_9834_iftrue <= VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iftrue;
     MUX_uxn_opcodes_h_l1281_c21_9834_iffalse <= VAR_MUX_uxn_opcodes_h_l1281_c21_9834_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1281_c21_9834_return_output := MUX_uxn_opcodes_h_l1281_c21_9834_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue := VAR_MUX_uxn_opcodes_h_l1281_c21_9834_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_9e4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_9e4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1271_c7_90e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1271_c7_90e8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_aa5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_aa5a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c7_e0a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_e0a1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1259_c7_9b46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output := result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9b46_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1252_c2_1fac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1289_l1248_DUPLICATE_da71 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1289_l1248_DUPLICATE_da71_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c2_1fac_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1289_l1248_DUPLICATE_da71_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1289_l1248_DUPLICATE_da71_return_output;
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
