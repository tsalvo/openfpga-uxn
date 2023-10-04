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
-- Submodules: 107
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1132_c6_a103]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1132_c1_34d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c2_ede8]
signal n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1133_c3_9bb0[uxn_opcodes_h_l1133_c3_9bb0]
signal printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1138_c11_70e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1138_c7_bd94]
signal n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_203f]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_f01c]
signal n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_ec3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c7_e098]
signal t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_e098]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c7_e098]
signal n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_87cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1149_c7_ea93]
signal n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1150_c3_8735]
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_da17]
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_2926]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1153_c7_2926]
signal n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_c27d]
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_b922]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1156_c7_b922]
signal n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_9d8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1161_c7_e8a8]
signal n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_7742]
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_c997]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1164_c7_c997]
signal n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1165_c3_8475]
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1168_c32_0f3e]
signal BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1168_c32_3ed6]
signal BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1168_c32_0102]
signal MUX_uxn_opcodes_h_l1168_c32_0102_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1168_c32_0102_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1168_c32_0102_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1168_c32_0102_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_26b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_32ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_32ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_32ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_32ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_32ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1174_c24_b730]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1174_c24_eb03]
signal MUX_uxn_opcodes_h_l1174_c24_eb03_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1174_c24_eb03_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_f31b]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_039d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_039d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103
BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c2_ede8
t16_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8
result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8
result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c2_ede8
n16_MUX_uxn_opcodes_h_l1132_c2_ede8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond,
n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

-- printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0
printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0 : entity work.printf_uxn_opcodes_h_l1133_c3_9bb0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7
BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output);

-- t16_MUX_uxn_opcodes_h_l1138_c7_bd94
t16_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94
result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94
result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- n16_MUX_uxn_opcodes_h_l1138_c7_bd94
n16_MUX_uxn_opcodes_h_l1138_c7_bd94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond,
n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue,
n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse,
n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output);

-- t16_MUX_uxn_opcodes_h_l1141_c7_f01c
t16_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_f01c
n16_MUX_uxn_opcodes_h_l1141_c7_f01c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c7_e098
t16_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c7_e098
n16_MUX_uxn_opcodes_h_l1146_c7_e098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond,
n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output);

-- t16_MUX_uxn_opcodes_h_l1149_c7_ea93
t16_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- n16_MUX_uxn_opcodes_h_l1149_c7_ea93
n16_MUX_uxn_opcodes_h_l1149_c7_ea93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond,
n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue,
n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse,
n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735
BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- n16_MUX_uxn_opcodes_h_l1153_c7_2926
n16_MUX_uxn_opcodes_h_l1153_c7_2926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond,
n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue,
n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse,
n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- n16_MUX_uxn_opcodes_h_l1156_c7_b922
n16_MUX_uxn_opcodes_h_l1156_c7_b922 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond,
n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue,
n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse,
n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- n16_MUX_uxn_opcodes_h_l1161_c7_e8a8
n16_MUX_uxn_opcodes_h_l1161_c7_e8a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond,
n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue,
n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse,
n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- n16_MUX_uxn_opcodes_h_l1164_c7_c997
n16_MUX_uxn_opcodes_h_l1164_c7_c997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond,
n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue,
n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse,
n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475
BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left,
BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right,
BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e
BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left,
BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right,
BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6
BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left,
BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right,
BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output);

-- MUX_uxn_opcodes_h_l1168_c32_0102
MUX_uxn_opcodes_h_l1168_c32_0102 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1168_c32_0102_cond,
MUX_uxn_opcodes_h_l1168_c32_0102_iftrue,
MUX_uxn_opcodes_h_l1168_c32_0102_iffalse,
MUX_uxn_opcodes_h_l1168_c32_0102_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730
BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output);

-- MUX_uxn_opcodes_h_l1174_c24_eb03
MUX_uxn_opcodes_h_l1174_c24_eb03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1174_c24_eb03_cond,
MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue,
MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse,
MUX_uxn_opcodes_h_l1174_c24_eb03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output,
 t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output,
 t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output,
 t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output,
 MUX_uxn_opcodes_h_l1168_c32_0102_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output,
 MUX_uxn_opcodes_h_l1174_c24_eb03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_4b3f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_7afd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_d8c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_2b6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_7ad3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_9281 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_14b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_f3e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1168_c32_0102_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1168_c32_0102_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_1986 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1164_l1170_DUPLICATE_9a62_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1181_l1128_DUPLICATE_b09c_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_1986 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_1986;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_d8c5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_d8c5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_2b6d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_2b6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_4b3f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_4b3f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_f3e3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_f3e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_14b4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_14b4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_7ad3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_7ad3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_7afd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_7afd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_9281 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_9281;
     VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iffalse := resize(to_signed(-3, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_ec3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_203f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_87cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_da17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1168_c32_0f3e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_left;
     BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output := BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1138_c11_70e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_26b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_7742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_f31b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c6_a103] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_9d8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c24_b730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_c27d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1164_l1170_DUPLICATE_9a62 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1164_l1170_DUPLICATE_9a62_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1168_c32_0f3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c6_a103_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c11_70e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_203f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_ec3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_87cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_da17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_c27d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9d8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_7742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_26b5_return_output;
     VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c24_b730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_f31b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1157_l1165_l1150_l1142_DUPLICATE_79be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_b8b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1170_l1141_l1164_l1138_l1161_l1156_DUPLICATE_9fb1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1138_l1161_l1132_l1156_DUPLICATE_14a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1141_l1164_l1138_l1161_l1156_DUPLICATE_f2e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1149_l1176_l1146_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_f1d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1164_l1170_DUPLICATE_9a62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1164_l1170_DUPLICATE_9a62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1170_l1141_l1164_l1138_l1161_l1132_l1156_DUPLICATE_33e1_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1132_c1_34d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_039d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1165_c3_8475] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_left;
     BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output := BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_32ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_039d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1150_c3_8735] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_left;
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output := BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output;

     -- MUX[uxn_opcodes_h_l1174_c24_eb03] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1174_c24_eb03_cond <= VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_cond;
     MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue <= VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iftrue;
     MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse <= VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_return_output := MUX_uxn_opcodes_h_l1174_c24_eb03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_32ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1168_c32_3ed6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_left;
     BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output := BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1168_c32_0102_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1168_c32_3ed6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_8735_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1165_c3_8475_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1158_l1143_DUPLICATE_f39b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue := VAR_MUX_uxn_opcodes_h_l1174_c24_eb03_return_output;
     VAR_printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1132_c1_34d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_039d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_039d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- printf_uxn_opcodes_h_l1133_c3_9bb0[uxn_opcodes_h_l1133_c3_9bb0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1133_c3_9bb0_uxn_opcodes_h_l1133_c3_9bb0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_32ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_32ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;

     -- MUX[uxn_opcodes_h_l1168_c32_0102] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1168_c32_0102_cond <= VAR_MUX_uxn_opcodes_h_l1168_c32_0102_cond;
     MUX_uxn_opcodes_h_l1168_c32_0102_iftrue <= VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iftrue;
     MUX_uxn_opcodes_h_l1168_c32_0102_iffalse <= VAR_MUX_uxn_opcodes_h_l1168_c32_0102_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1168_c32_0102_return_output := MUX_uxn_opcodes_h_l1168_c32_0102_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_32ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue := VAR_MUX_uxn_opcodes_h_l1168_c32_0102_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_32ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- t16_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- n16_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_c997] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_c997_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_e8a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_e8a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- n16_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_b922] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;

     -- t16_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_b922_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     -- t16_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_2926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;

     -- n16_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_2926_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- n16_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_ea93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_ea93_return_output;
     -- n16_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_e098] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_e098_return_output;
     -- n16_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_f01c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_f01c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1138_c7_bd94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1138_c7_bd94_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c2_ede8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1181_l1128_DUPLICATE_b09c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1181_l1128_DUPLICATE_b09c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1132_c2_ede8_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1181_l1128_DUPLICATE_b09c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1181_l1128_DUPLICATE_b09c_return_output;
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
